@interface MFMailboxUserInfo
- (MFMailboxUserInfo)init;
- (MFMailboxUserInfo)initWithFileURL:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation MFMailboxUserInfo

- (void).cxx_destruct
{
}

- (MFMailboxUserInfo)initWithFileURL:(id)a3
{
  v9 = self;
  id v17 = a3;
  swift_getObjectType();
  uint64_t v10 = sub_1A8A74998();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = v10 - 8;
  unint64_t v13 = (*(void *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v10);
  v14 = (char *)&v6 - v13;
  unint64_t v15 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9748660) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3 = (void *)MEMORY[0x1F4188790](v17);
  v16 = (char *)&v6 - v15;
  id v4 = v3;
  if (v17)
  {
    id v8 = v17;
    id v7 = v17;
    sub_1A8A74928();
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v16, v14, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v16, 0, 1, v10);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v16, 1, 1, v10);
  }
  return (MFMailboxUserInfo *)MFMailboxUserInfo.init(fileURL:)(v16);
}

- (id)objectForKeyedSubscript:(id)a3
{
  swift_getObjectType();
  id v4 = a3;
  v5 = self;
  uint64_t v6 = sub_1A8A76558();
  id v11 = (id)MFMailboxUserInfo.subscript.getter(v6, v7);
  swift_bridgeObjectRelease();

  return v11;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  swift_getObjectType();
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  uint64_t v8 = sub_1A8A76558();
  MFMailboxUserInfo.subscript.setter(a3, v8, v9);
}

- (MFMailboxUserInfo)init
{
  return (MFMailboxUserInfo *)MFMailboxUserInfo.init()();
}

@end