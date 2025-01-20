@interface NARSYStoreSerializer
- (id)SYObjectWithData:(id)a3;
- (id)changeFromData:(id)a3 ofType:(int64_t)a4;
- (id)dataFromChange:(id)a3;
- (id)dataWithSYObject:(id)a3;
- (id)decodeChangeData:(id)a3 fromProtocolVersion:(int64_t)a4 ofType:(int64_t)a5;
@end

@implementation NARSYStoreSerializer

- (id)dataWithSYObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = objc_alloc_init(NARPBProtoBuffMessage);
    [(NARPBProtoBuffMessage *)v4 setApplicationWrapper:v3];
LABEL_5:
    v5 = [(NARPBProtoBuffMessage *)v4 data];

    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = objc_alloc_init(NARPBProtoBuffMessage);
    [(NARPBProtoBuffMessage *)v4 setWorkspaceMetadata:v3];
    goto LABEL_5;
  }
  v5 = 0;
LABEL_7:

  return v5;
}

- (id)SYObjectWithData:(id)a3
{
  id v3 = a3;
  v4 = [[NARPBProtoBuffMessage alloc] initWithData:v3];

  v5 = [(NARPBProtoBuffMessage *)v4 applicationWrapper];

  if (v5)
  {
    uint64_t v6 = [(NARPBProtoBuffMessage *)v4 applicationWrapper];
  }
  else
  {
    v7 = [(NARPBProtoBuffMessage *)v4 workspaceMetadata];

    if (!v7) {
      goto LABEL_6;
    }
    uint64_t v6 = [(NARPBProtoBuffMessage *)v4 workspaceMetadata];
  }
  v7 = (void *)v6;
LABEL_6:

  return v7;
}

- (id)dataFromChange:(id)a3
{
  return [(NARSYStoreSerializer *)self dataWithSYObject:a3];
}

- (id)changeFromData:(id)a3 ofType:(int64_t)a4
{
  return -[NARSYStoreSerializer SYObjectWithData:](self, "SYObjectWithData:", a3, a4);
}

- (id)decodeChangeData:(id)a3 fromProtocolVersion:(int64_t)a4 ofType:(int64_t)a5
{
  return [(NARSYStoreSerializer *)self changeFromData:a3 ofType:a5];
}

@end