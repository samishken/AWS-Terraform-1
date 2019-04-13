# Internet VPC
resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    tags {
        Name = "main"
    }
}


# Subnets
resource "aws_subnet" "main-public-1" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1a"

    tags {
        Name = "main-public-1"
    }
}
resource "aws_subnet" "main-public-2" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1b"

    tags {
        Name = "main-public-2"
    }
}
resource "aws_subnet" "main-public-3" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.3.1/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1c"

    tags {
        Name = "main-public-3"
    }
}

resource "aws_subnet" "main-public-4" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.4.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1d"

    tags {
        Name = "main-public-4"
    }
}

resource "aws_subnet" "main-public-5" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.5.1/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1e"

    tags {
        Name = "main-public-5"
    }
}

resource "aws_subnet" "main-public-6" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.6.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1f"

    tags {
        Name = "main-public-6"
    }
}

resource "aws_subnet" "main-private-1" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.7.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-1a"

    tags {
        Name = "main-private-1"
    }
}
resource "aws_subnet" "main-private-2" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.8.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-1b"

    tags {
        Name = "main-private-2"
    }
}
resource "aws_subnet" "main-private-3" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.9.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-1c"

    tags {
        Name = "main-private-3"
    }
}

resource "aws_subnet" "main-private-4" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.10.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-1d"

    tags {
        Name = "main-private-4"
    }
}

resource "aws_subnet" "main-private-5" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.11.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-1e"

    tags {
        Name = "main-private-5"
    }
}

resource "aws_subnet" "main-private-6" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.12.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-1f"

    tags {
        Name = "main-private-6"
    }
}

# Internet GW
resource "aws_internet_gateway" "main-gw" {
    vpc_id = "${aws_vpc.main.id}"

    tags {
        Name = "main"
    }
}

# route tables
resource "aws_route_table" "main-public" {
    vpc_id = "${aws_vpc.main.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.main-gw.id}"
    }

    tags {
        Name = "main-public-1"
    }
}

# route associations public
resource "aws_route_table_association" "main-public-1-a" {
    subnet_id = "${aws_subnet.main-public-1.id}"
    route_table_id = "${aws_route_table.main-public.id}"
}
resource "aws_route_table_association" "main-public-2-a" {
    subnet_id = "${aws_subnet.main-public-2.id}"
    route_table_id = "${aws_route_table.main-public.id}"
}
resource "aws_route_table_association" "main-public-3-a" {
    subnet_id = "${aws_subnet.main-public-3.id}"
    route_table_id = "${aws_route_table.main-public.id}"
}
resource "aws_route_table_association" "main-public-4-a" {
    subnet_id = "${aws_subnet.main-public-4.id}"
    route_table_id = "${aws_route_table.main-public.id}"
} 
resource "aws_route_table_association" "main-public-5-a" {
    subnet_id = "${aws_subnet.main-public-5.id}"
    route_table_id = "${aws_route_table.main-public.id}"
} 
resource "aws_route_table_association" "main-public-6-a" {
    subnet_id = "${aws_subnet.main-public-6.id}"
    route_table_id = "${aws_route_table.main-public.id}"
}
