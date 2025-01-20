@interface MRIRNode
+ (id)nodeFromIRNode:(id)a3;
+ (id)nodeFromOutputDevice:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocal;
- (MRIRNode)initWithAVOutputDeviceID:(id)a3 isLocal:(BOOL)a4;
- (NSString)avOutputDeviceIdentifier;
- (NSString)description;
- (NSString)idsIdentifier;
- (NSString)rapportIdentifier;
- (unint64_t)hash;
- (void)setAvOutputDeviceIdentifier:(id)a3;
- (void)setIdsIdentifier:(id)a3;
- (void)setIsLocal:(BOOL)a3;
- (void)setRapportIdentifier:(id)a3;
@end

@implementation MRIRNode

+ (id)nodeFromIRNode:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(MRIRNode);
  v5 = [v3 avOutpuDeviceIdentifier];
  [(MRIRNode *)v4 setAvOutputDeviceIdentifier:v5];

  v6 = [v3 rapportIdentifier];
  [(MRIRNode *)v4 setRapportIdentifier:v6];

  v7 = [v3 idsIdentifier];
  [(MRIRNode *)v4 setIdsIdentifier:v7];

  uint64_t v8 = [v3 isLocal];
  [(MRIRNode *)v4 setIsLocal:v8];

  return v4;
}

+ (id)nodeFromOutputDevice:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 deviceType] == 4;
  v5 = [MRIRNode alloc];
  v6 = [v3 uid];

  v7 = [(MRIRNode *)v5 initWithAVOutputDeviceID:v6 isLocal:v4];

  return v7;
}

- (MRIRNode)initWithAVOutputDeviceID:(id)a3 isLocal:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (__CFString *)a3;
  uint64_t v8 = v7;
  if (!v4 && [(__CFString *)v7 isEqualToString:@"Speaker"])
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MRRouteRepresentable.m" lineNumber:62 description:@"Non local MRIRNodes not allowed with id = \"Speaker\"!"];
  }
  v14.receiver = self;
  v14.super_class = (Class)MRIRNode;
  v10 = [(MRIRNode *)&v14 init];
  v11 = v10;
  if (v10)
  {
    if (v4) {
      v12 = @"Speaker";
    }
    else {
      v12 = v8;
    }
    [(MRIRNode *)v10 setAvOutputDeviceIdentifier:v12];
    [(MRIRNode *)v11 setIsLocal:v4];
  }

  return v11;
}

- (NSString)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  BOOL v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@ (%p): ", v5, self];

  v7 = [(MRIRNode *)self avOutputDeviceIdentifier];
  [v6 appendFormat:@"avOutputDeviceIdentifier: %@", v7];

  uint64_t v8 = [(MRIRNode *)self rapportIdentifier];
  [v6 appendFormat:@", rapportIdentifier: %@", v8];

  v9 = [(MRIRNode *)self idsIdentifier];
  [v6 appendFormat:@", idsIdentifier: %@", v9];

  [v6 appendString:@">"];

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (MRIRNode *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v9 = 1;
  }
  else if ([(MRIRNode *)v4 conformsToProtocol:&unk_1EE6A5F78])
  {
    v6 = v5;
    v7 = [(MRIRNode *)self avOutputDeviceIdentifier];
    uint64_t v8 = [(MRIRNode *)v6 avOutputDeviceIdentifier];
    if (v7 == v8) {
      char v9 = 1;
    }
    else {
      char v9 = [v7 isEqual:v8];
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v2 = [(MRIRNode *)self avOutputDeviceIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)avOutputDeviceIdentifier
{
  return self->_avOutputDeviceIdentifier;
}

- (void)setAvOutputDeviceIdentifier:(id)a3
{
}

- (NSString)rapportIdentifier
{
  return self->_rapportIdentifier;
}

- (void)setRapportIdentifier:(id)a3
{
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
{
}

- (BOOL)isLocal
{
  return self->_isLocal;
}

- (void)setIsLocal:(BOOL)a3
{
  self->_isLocal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_rapportIdentifier, 0);

  objc_storeStrong((id *)&self->_avOutputDeviceIdentifier, 0);
}

@end