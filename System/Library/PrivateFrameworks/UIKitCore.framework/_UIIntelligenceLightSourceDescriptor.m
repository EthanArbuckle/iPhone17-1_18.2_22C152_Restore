@interface _UIIntelligenceLightSourceDescriptor
+ (id)directionalLightWithConfiguration:(id)a3;
+ (id)livingLightWithPalette:(id)a3;
+ (id)livingLightWithPalette:(id)a3 seed:(unsigned int)a4;
+ (id)sharedLight;
+ (id)sharedReactiveLight;
+ (id)sharedReactiveShimmeringLight;
+ (id)sharedShimmeringLight;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (_UIIntelligenceLightSourceDescriptor)descriptorWithModificationID:(id)a3 modifier:(id)a4;
- (_UIIntelligenceLightSourceDescriptor)initWithIdentifier:(id)a3 lightSourceViewProvider:(id)a4;
- (id)_createLightSourceViewWithFrame:(CGRect)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (unint64_t)hash;
@end

@implementation _UIIntelligenceLightSourceDescriptor

+ (id)livingLightWithPalette:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_1859A3C88((uint64_t)v4);

  return v5;
}

+ (id)livingLightWithPalette:(id)a3 seed:(unsigned int)a4
{
  swift_getObjCClassMetadata();
  id v6 = a3;
  id v7 = sub_1859A3D28(v6, a4);

  return v7;
}

+ (id)directionalLightWithConfiguration:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_185A5D240(v4);

  return v5;
}

+ (id)sharedLight
{
  swift_getObjCClassMetadata();
  id v2 = sub_185A6C6A4(0x646572616873, 0xE600000000000000, (uint64_t)sub_185A6C4D0, (uint64_t)&block_descriptor_9_0);
  return v2;
}

+ (id)sharedReactiveLight
{
  swift_getObjCClassMetadata();
  id v2 = sub_185A6C6A4(0x722D646572616873, 0xEF65766974636165, (uint64_t)sub_185A6C53C, (uint64_t)&block_descriptor_6_6);
  return v2;
}

+ (id)sharedShimmeringLight
{
  swift_getObjCClassMetadata();
  id v2 = sub_185A6C6A4(0xD000000000000011, 0x8000000186BA7D60, (uint64_t)sub_185A6C630, (uint64_t)&block_descriptor_3_3);
  return v2;
}

+ (id)sharedReactiveShimmeringLight
{
  swift_getObjCClassMetadata();
  id v2 = sub_185A6C6A4(0xD00000000000001ALL, 0x8000000186BA7D40, (uint64_t)sub_185A6C788, (uint64_t)&block_descriptor_55);
  return v2;
}

- (_UIIntelligenceLightSourceDescriptor)initWithIdentifier:(id)a3 lightSourceViewProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UIIntelligenceLightSourceDescriptor;
  v9 = [(_UIIntelligenceLightSourceDescriptor *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    v11 = _Block_copy(v8);
    id builder = v10->_builder;
    v10->_id builder = v11;
  }
  return v10;
}

- (id)_createLightSourceViewWithFrame:(CGRect)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__204;
  v11 = __Block_byref_object_dispose__204;
  id v12 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72___UIIntelligenceLightSourceDescriptor__createLightSourceViewWithFrame___block_invoke;
  v5[3] = &unk_1E530A2E0;
  v5[4] = self;
  v5[5] = &v7;
  CGRect v6 = a3;
  +[UIView performWithoutAnimation:v5];
  id v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v3;
}

- (_UIIntelligenceLightSourceDescriptor)descriptorWithModificationID:(id)a3 modifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(_UIIntelligenceLightSourceDescriptor *)self copy];
  uint64_t v9 = [*(id *)(v8 + 16) stringByAppendingFormat:@".%@", v7];

  v10 = *(void **)(v8 + 16);
  *(void *)(v8 + 16) = v9;

  v11 = _Block_copy(self->_builder);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __78___UIIntelligenceLightSourceDescriptor_descriptorWithModificationID_modifier___block_invoke;
  aBlock[3] = &unk_1E530A308;
  id v18 = v11;
  id v19 = v6;
  id v12 = v6;
  id v13 = v11;
  objc_super v14 = _Block_copy(aBlock);
  v15 = *(void **)(v8 + 8);
  *(void *)(v8 + 8) = v14;

  return (_UIIntelligenceLightSourceDescriptor *)(id)v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [_UIIntelligenceLightSourceDescriptor alloc];
  id builder = self->_builder;
  identifier = self->_identifier;
  return [(_UIIntelligenceLightSourceDescriptor *)v4 initWithIdentifier:identifier lightSourceViewProvider:builder];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (id *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [v4[2] isEqualToString:self->_identifier];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"<%@: %p %@>", self, self, self->_identifier];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_builder, 0);
}

@end