@interface PPFlightAirport
- (BOOL)isEqualToPPFlightAirport:(id)a3;
- (NSString)iataCode;
- (NSString)name;
- (PPFlightAirport)initWithName:(id)a3 iataCode:(id)a4 role:(unsigned __int8)a5;
- (unsigned)role;
@end

@implementation PPFlightAirport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iataCode, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (unsigned)role
{
  return self->_role;
}

- (NSString)iataCode
{
  return self->_iataCode;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isEqualToPPFlightAirport:(id)a3
{
  id v4 = a3;
  v5 = [(PPFlightAirport *)self iataCode];
  v6 = [v4 iataCode];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (PPFlightAirport)initWithName:(id)a3 iataCode:(id)a4 role:(unsigned __int8)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PPFlightAirport;
  v11 = [(PPFlightAirport *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a3);
    objc_storeStrong((id *)&v12->_iataCode, a4);
    v12->_role = a5;
  }

  return v12;
}

@end