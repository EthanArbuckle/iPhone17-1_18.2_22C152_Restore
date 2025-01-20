@interface LaunchWarningClientOperations
- (BOOL)setUserOverride:(BOOL)a3 forBundle:(id)a4 error:(id *)a5;
- (_TtC3mis29LaunchWarningClientOperations)init;
- (id)checkForLaunchWarning:(id)a3 error:(id *)a4;
- (id)queryAppBundle:(id)a3 error:(id *)a4;
- (id)queryExecutableURL:(id)a3 error:(id *)a4;
@end

@implementation LaunchWarningClientOperations

- (id)queryExecutableURL:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_20DC24758();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20DC24728();
  v9 = self;
  sub_20DBFEA3C();
  v11 = v10;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v11;
}

- (_TtC3mis29LaunchWarningClientOperations)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LaunchWarningClientOperations();
  return [(LaunchWarningClientOperations *)&v3 init];
}

- (id)queryAppBundle:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_20DC24758();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20DC24728();
  v9 = self;
  v10 = sub_20DC0A8F0((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v10;
}

- (id)checkForLaunchWarning:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_20DC24758();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20DC24728();
  v9 = self;
  id v10 = sub_20DC0AFE0();
  unint64_t v12 = v11;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  uint64_t v13 = (void *)sub_20DC24798();
  sub_20DC02730((uint64_t)v10, v12);

  return v13;
}

- (BOOL)setUserOverride:(BOOL)a3 forBundle:(id)a4 error:(id *)a5
{
  uint64_t v7 = sub_20DC24758();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20DC24728();
  unint64_t v11 = self;
  sub_20DC0B2B0(a3, (uint64_t)v10);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return 1;
}

@end