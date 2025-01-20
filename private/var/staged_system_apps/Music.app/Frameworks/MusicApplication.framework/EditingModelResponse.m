@interface EditingModelResponse
- (_TtC16MusicApplication20EditingModelResponse)initWithRequest:(id)a3;
- (void)getChangeDetailsFromPreviousResponse:(id)a3 completion:(id)a4;
@end

@implementation EditingModelResponse

- (_TtC16MusicApplication20EditingModelResponse)initWithRequest:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for EditingModelResponse();
  id v4 = a3;
  result = [(EditingModelResponse *)&v7 initWithRequest:v4];
  if (result)
  {
    v6 = result;

    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)getChangeDetailsFromPreviousResponse:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_C30F0;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_E46B8(a3, (uint64_t)v6, v7);
  sub_1A528((uint64_t)v6);
}

@end