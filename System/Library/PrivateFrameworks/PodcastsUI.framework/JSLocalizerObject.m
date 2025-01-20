@interface JSLocalizerObject
- (_TtC10PodcastsUI17JSLocalizerObject)init;
- (id)decimal:(id)a3 :(id)a4 :(id)a5 :(id)a6;
- (id)fileSize:(id)a3;
- (id)formattedCount:(id)a3;
- (id)formattedDateInSentence:(id)a3 :(id)a4 :(id)a5;
- (id)formattedDateWithContext:(id)a3 :(id)a4 :(id)a5;
- (id)relativeDate:(id)a3;
- (id)string:(id)a3 :(id)a4;
- (id)stringWithCount:(id)a3 :(id)a4 :(id)a5;
@end

@implementation JSLocalizerObject

- (id)string:(id)a3 :(id)a4
{
  swift_getObjectType();
  sub_1E3CB0EFC();
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  v10 = (void *)sub_1E3E7DAC0();
  v11 = (void *)sub_1E3E7DAD0();

  return v11;
}

- (id)decimal:(id)a3 :(id)a4 :(id)a5 :(id)a6
{
  swift_getObjectType();
  sub_1E3CB0EFC();
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = self;
  v16 = (void *)sub_1E3E7DAC0();
  v17 = (void *)sub_1E3E7DAD0();

  return v17;
}

- (id)stringWithCount:(id)a3 :(id)a4 :(id)a5
{
  swift_getObjectType();
  sub_1E3CB0EFC();
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = self;
  id v13 = (void *)sub_1E3E7DAC0();
  id v14 = (void *)sub_1E3E7DAD0();

  return v14;
}

- (id)formattedCount:(id)a3
{
  return sub_1E3CBA988(self, (uint64_t)a2, a3);
}

- (id)fileSize:(id)a3
{
  return sub_1E3CBA988(self, (uint64_t)a2, a3);
}

- (id)formattedDateWithContext:(id)a3 :(id)a4 :(id)a5
{
  swift_getObjectType();
  sub_1E3CB0EFC();
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = self;
  id v13 = (void *)sub_1E3E7DAC0();
  id v14 = (void *)sub_1E3E7DAD0();

  return v14;
}

- (id)formattedDateInSentence:(id)a3 :(id)a4 :(id)a5
{
  sub_1E3CB0EFC();
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = self;
  id v13 = (void *)sub_1E3E7DAC0();
  id v14 = (void *)sub_1E3E7DAD0();

  return v14;
}

- (id)relativeDate:(id)a3
{
  swift_getObjectType();
  sub_1E3CB0EFC();
  id v5 = a3;
  v6 = self;
  id v7 = (void *)sub_1E3E7DAC0();
  id v8 = (void *)sub_1E3E7DAD0();

  return v8;
}

- (_TtC10PodcastsUI17JSLocalizerObject)init
{
  result = (_TtC10PodcastsUI17JSLocalizerObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end