@interface NFTrustDBApplet
+ (BOOL)supportsSecureCoding;
- (NFTrustDBApplet)initWithCoder:(id)a3;
- (NSArray)map;
- (NSString)instanceAID;
- (void)encodeWithCoder:(id)a3;
- (void)setInstanceAID:(id)a3;
- (void)setMap:(id)a3;
@end

@implementation NFTrustDBApplet

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFTrustDBApplet)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NFTrustDBApplet;
  v5 = [(NFTrustObject *)&v19 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"instanceAID"];
    [(NFTrustDBApplet *)v5 setValue:v6 forKey:@"instanceAID"];

    v7 = +[NFNSCheckedDecoder coder:v4 decodeArrayOfClass:objc_opt_class() forKey:@"map"];
    [(NFTrustDBApplet *)v5 setValue:v7 forKey:@"map"];

    v8 = [(NFTrustDBApplet *)v5 map];
    id v9 = [v8 count];

    if (v9 != (id)2)
    {
      v10 = +[NSMutableArray array];
      unint64_t v11 = 0;
      char v12 = 1;
      do
      {
        char v13 = v12;
        v14 = [(NFTrustDBApplet *)v5 map];
        id v15 = [v14 count];

        if ((unint64_t)v15 <= v11)
        {
          v16 = [KeyInSlot alloc];
          [v10 addObject:v16];
        }
        else
        {
          v16 = [(NFTrustDBApplet *)v5 map];
          v17 = [(KeyInSlot *)v16 objectAtIndex:v11];
          [v10 addObject:v17];
        }
        char v12 = 0;
        unint64_t v11 = 1;
      }
      while ((v13 & 1) != 0);
      [(NFTrustDBApplet *)v5 setMap:v10];
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NFTrustDBApplet *)self instanceAID];
  [v4 encodeObject:v5 forKey:@"instanceAID"];

  id v6 = [(NFTrustDBApplet *)self map];
  [v4 encodeObject:v6 forKey:@"map"];
}

- (NSString)instanceAID
{
  return self->_instanceAID;
}

- (void)setInstanceAID:(id)a3
{
}

- (NSArray)map
{
  return self->_map;
}

- (void)setMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_map, 0);

  objc_storeStrong((id *)&self->_instanceAID, 0);
}

@end