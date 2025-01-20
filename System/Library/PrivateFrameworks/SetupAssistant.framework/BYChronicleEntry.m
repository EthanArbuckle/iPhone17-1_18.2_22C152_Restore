@interface BYChronicleEntry
- (BOOL)createdOnCurrentMajorVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEntry:(id)a3;
- (BYChronicleEntry)init;
- (BYChronicleEntry)initWithDictionary:(id)a3;
- (BYChronicleEntry)initWithProductVersion:(id)a3;
- (NSString)productVersion;
- (id)description;
- (id)dictionaryRepresentation;
- (void)setProductVersion:(id)a3;
@end

@implementation BYChronicleEntry

- (BYChronicleEntry)init
{
  v3 = +[BYDeviceConfiguration currentConfiguration];
  v4 = [v3 productVersion];
  v5 = [(BYChronicleEntry *)self initWithProductVersion:v4];

  return v5;
}

- (BYChronicleEntry)initWithProductVersion:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BYChronicleEntry;
  v5 = [(BYChronicleEntry *)&v8 init];
  v6 = v5;
  if (v5) {
    [(BYChronicleEntry *)v5 setProductVersion:v4];
  }

  return v6;
}

- (BYChronicleEntry)initWithDictionary:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"productVersion"];
  v5 = [(BYChronicleEntry *)self initWithProductVersion:v4];

  return v5;
}

- (BOOL)createdOnCurrentMajorVersion
{
  v3 = +[BYDeviceConfiguration currentConfiguration];
  id v4 = [v3 productVersion];
  v5 = [v4 componentsSeparatedByString:@"."];

  if ([v5 count])
  {
    v6 = [v5 objectAtIndex:0];
    int v7 = [v6 intValue];

    objc_super v8 = [(BYChronicleEntry *)self productVersion];
    v9 = [v8 componentsSeparatedByString:@"."];

    if ([v9 count])
    {
      v10 = [v9 objectAtIndex:0];
      int v11 = [v10 intValue];

      BOOL v12 = v7 == v11;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)dictionaryRepresentation
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"productVersion";
  v2 = [(BYChronicleEntry *)self productVersion];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(BYChronicleEntry *)self productVersion];
  v6 = [v3 stringWithFormat:@"<%@ : %p> Product Version: %@", v4, self, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(BYChronicleEntry *)self isEqualToEntry:v4];

  return v5;
}

- (BOOL)isEqualToEntry:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BYChronicleEntry *)self productVersion];
  v6 = [v4 productVersion];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end