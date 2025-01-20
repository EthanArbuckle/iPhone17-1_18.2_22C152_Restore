@interface PBRemotePasteboardItemProvider
- (BOOL)preferFileRep;
- (NSString)type;
- (NSUUID)uuid;
- (PBItem)item;
- (PBRemotePasteboardItemProvider)initWithType:(id)a3 item:(id)a4;
- (id)getFileName;
- (void)getDataFileWithCompletionBlock:(id)a3;
- (void)getDataWithCompletionBlock:(id)a3;
- (void)setItem:(id)a3;
- (void)setPreferFileRep:(BOOL)a3;
- (void)setType:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation PBRemotePasteboardItemProvider

- (PBRemotePasteboardItemProvider)initWithType:(id)a3 item:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PBRemotePasteboardItemProvider;
  v8 = [(PBRemotePasteboardItemProvider *)&v12 init];
  v9 = v8;
  if (v8)
  {
    [(PBRemotePasteboardItemProvider *)v8 setType:v6];
    [(PBRemotePasteboardItemProvider *)v9 setItem:v7];
    v10 = [v7 UUID];
    [(PBRemotePasteboardItemProvider *)v9 setUuid:v10];

    -[PBRemotePasteboardItemProvider setPreferFileRep:](v9, "setPreferFileRep:", [v7 preferredRepresentationForType:v6] != 0);
  }

  return v9;
}

- (void)getDataFileWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = [(PBRemotePasteboardItemProvider *)self item];
  id v6 = [(PBRemotePasteboardItemProvider *)self type];
  id v7 = [v5 representationConformingToType:v6];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100013888;
  v10[3] = &unk_100031848;
  v10[4] = self;
  id v11 = v4;
  id v8 = v4;
  id v9 = [v7 loadWithCompletionHandler:v10];
}

- (id)getFileName
{
  v3 = [(PBRemotePasteboardItemProvider *)self item];
  id v4 = [v3 metadata];
  v5 = [v4 objectForKeyedSubscript:PBMetadataSuggestedNameKey];

  id v6 = [(PBRemotePasteboardItemProvider *)self type];
  id v7 = PBFilenameWithProperExtension();

  return v7;
}

- (void)getDataWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = [(PBRemotePasteboardItemProvider *)self item];
  id v6 = [(PBRemotePasteboardItemProvider *)self type];
  id v7 = [v5 representationConformingToType:v6];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100013F7C;
  v10[3] = &unk_1000318D8;
  id v11 = v4;
  id v8 = v4;
  id v9 = [v7 loadWithCompletionHandler:v10];
}

- (PBItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (BOOL)preferFileRep
{
  return self->_preferFileRep;
}

- (void)setPreferFileRep:(BOOL)a3
{
  self->_preferFileRep = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end