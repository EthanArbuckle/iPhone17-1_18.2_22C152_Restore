@interface PXGViewRecordingViewSerializable
- (BOOL)needsParenting;
- (NSString)payloadViewClass;
- (PXGViewRecordingViewSerializable)initWithSerializableObject:(id)a3;
- (id)createSerializableObject;
- (unsigned)presentationType;
- (unsigned)spriteIndex;
- (void)setNeedsParenting:(BOOL)a3;
- (void)setPayloadViewClass:(id)a3;
- (void)setPresentationType:(unsigned __int8)a3;
- (void)setSpriteIndex:(unsigned int)a3;
@end

@implementation PXGViewRecordingViewSerializable

- (void).cxx_destruct
{
}

- (void)setNeedsParenting:(BOOL)a3
{
  self->_needsParenting = a3;
}

- (BOOL)needsParenting
{
  return self->_needsParenting;
}

- (void)setPayloadViewClass:(id)a3
{
}

- (NSString)payloadViewClass
{
  return self->_payloadViewClass;
}

- (void)setPresentationType:(unsigned __int8)a3
{
  self->_presentationType = a3;
}

- (unsigned)presentationType
{
  return self->_presentationType;
}

- (void)setSpriteIndex:(unsigned int)a3
{
  self->_spriteIndex = a3;
}

- (unsigned)spriteIndex
{
  return self->_spriteIndex;
}

- (id)createSerializableObject
{
  v13[4] = *MEMORY[0x1E4F143B8];
  v12[0] = @"spriteIndex";
  unsigned int v3 = [(PXGViewRecordingViewSerializable *)self spriteIndex];
  v4 = [NSNumber numberWithUnsignedInteger:v3];
  v13[0] = v4;
  v12[1] = @"presentationType";
  unsigned int v5 = [(PXGViewRecordingViewSerializable *)self presentationType];
  v6 = [NSNumber numberWithUnsignedInteger:v5];
  v13[1] = v6;
  v12[2] = @"payloadViewClass";
  v7 = [(PXGViewRecordingViewSerializable *)self payloadViewClass];
  v13[2] = v7;
  v12[3] = @"needsParenting";
  BOOL v8 = [(PXGViewRecordingViewSerializable *)self needsParenting];
  v9 = [NSNumber numberWithBool:v8];
  v13[3] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];

  return v10;
}

- (PXGViewRecordingViewSerializable)initWithSerializableObject:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXGViewRecordingViewSerializable;
  unsigned int v5 = [(PXGViewRecordingViewSerializable *)&v15 init];
  if (v5)
  {
    id v6 = v4;
    id v7 = [v6 objectForKeyedSubscript:@"spriteIndex"];
    unsigned int v8 = [v7 unsignedIntValue];

    v5->_spriteIndex = v8;
    id v9 = [v6 objectForKeyedSubscript:@"presentationType"];
    LOBYTE(v8) = [v9 unsignedIntValue];

    v5->_presentationType = v8;
    uint64_t v10 = [v6 objectForKeyedSubscript:@"payloadViewClass"];
    payloadViewClass = v5->_payloadViewClass;
    v5->_payloadViewClass = (NSString *)v10;

    v12 = [v6 objectForKeyedSubscript:@"needsParenting"];

    id v13 = v12;
    LOBYTE(v12) = [v13 BOOLValue];

    v5->_needsParenting = (char)v12;
  }

  return v5;
}

@end