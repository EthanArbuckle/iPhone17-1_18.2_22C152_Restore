@interface FeedURLComposer
+ (int64_t)errorCannotGenerateInternalURL;
+ (int64_t)errorURLDoesNotExist;
+ (int64_t)errorURLInvalid;
- (_TtC18PodcastsFoundation15FeedURLComposer)init;
- (id)feedURLForOptionalURL:(id)a3 adamID:(int64_t)a4 error:(id *)a5;
@end

@implementation FeedURLComposer

+ (int64_t)errorURLDoesNotExist
{
  return 0;
}

+ (int64_t)errorURLInvalid
{
  return 1;
}

+ (int64_t)errorCannotGenerateInternalURL
{
  return 2;
}

- (id)feedURLForOptionalURL:(id)a3 adamID:(int64_t)a4 error:(id *)a5
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7731B0);
  MEMORY[0x1F4188790](v8 - 8);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = sub_1ACE74F28();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  v14 = &v18[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a3)
  {
    sub_1ACE74E98();
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v12 + 56))(v10, 0, 1, v11);
  }
  else
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
  }
  v15 = self;
  sub_1ACAA6D98((uint64_t)v10, a4, (uint64_t)v14);
  sub_1ACA7FA64((uint64_t)v10);

  v16 = (void *)sub_1ACE74E18();
  (*(void (**)(unsigned char *, uint64_t))(v12 + 8))(v14, v11);
  return v16;
}

- (_TtC18PodcastsFoundation15FeedURLComposer)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FeedURLComposer();
  return [(FeedURLComposer *)&v3 init];
}

@end