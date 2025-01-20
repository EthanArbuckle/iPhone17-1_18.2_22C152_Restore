@interface RWIProtocolRuntimeTypeLocation
- (NSString)sourceID;
- (RWIProtocolRuntimeTypeLocation)initWithTypeInformationDescriptor:(int)a3 sourceID:(id)a4 divot:(int)a5;
- (int)divot;
- (int)typeInformationDescriptor;
- (void)setDivot:(int)a3;
- (void)setSourceID:(id)a3;
- (void)setTypeInformationDescriptor:(int)a3;
@end

@implementation RWIProtocolRuntimeTypeLocation

- (RWIProtocolRuntimeTypeLocation)initWithTypeInformationDescriptor:(int)a3 sourceID:(id)a4 divot:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RWIProtocolRuntimeTypeLocation;
  v9 = [(RWIProtocolJSONObject *)&v12 init];
  if (v9)
  {
    if (!v8) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"sourceID" format];
    }
    [(RWIProtocolRuntimeTypeLocation *)v9 setTypeInformationDescriptor:v6];
    [(RWIProtocolRuntimeTypeLocation *)v9 setSourceID:v8];
    [(RWIProtocolRuntimeTypeLocation *)v9 setDivot:v5];
    v10 = v9;
  }

  return v9;
}

- (void)setTypeInformationDescriptor:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeLocation;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"typeInformationDescriptor"];
}

- (int)typeInformationDescriptor
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeLocation;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"typeInformationDescriptor"];
}

- (void)setSourceID:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeLocation;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"sourceID"];
}

- (NSString)sourceID
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolRuntimeTypeLocation;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"sourceID"];
  return (NSString *)v2;
}

- (void)setDivot:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeLocation;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"divot"];
}

- (int)divot
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeLocation;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"divot"];
}

@end