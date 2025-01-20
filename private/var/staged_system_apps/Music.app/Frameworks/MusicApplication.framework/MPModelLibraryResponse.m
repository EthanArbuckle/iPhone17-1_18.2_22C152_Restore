@interface MPModelLibraryResponse
- (id)navigationHandlerForItemAt:(id)a3 sourceViewController:(id)a4;
@end

@implementation MPModelLibraryResponse

- (id)navigationHandlerForItemAt:(id)a3 sourceViewController:(id)a4
{
  uint64_t v7 = sub_AB1110();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  id v11 = a3;
  id v12 = a4;
  v13 = self;
  v14 = sub_23BA3C((uint64_t)v10, v12);
  uint64_t v16 = v15;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  if (v14)
  {
    aBlock[4] = v14;
    aBlock[5] = v16;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1DC200;
    aBlock[3] = &block_descriptor_3_0;
    v14 = _Block_copy(aBlock);
    swift_release();
  }

  return v14;
}

@end