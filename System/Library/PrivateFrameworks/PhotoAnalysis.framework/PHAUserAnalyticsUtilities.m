@interface PHAUserAnalyticsUtilities
- (BOOL)updateUserAnalyticsStreamWithProgressReporter:(id)a3 error:(id *)a4;
- (PHAUserAnalyticsUtilities)init;
- (PHAUserAnalyticsUtilities)initWithPhotoLibrary:(id)a3;
@end

@implementation PHAUserAnalyticsUtilities

- (PHAUserAnalyticsUtilities)initWithPhotoLibrary:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PHAUserAnalyticsUtilities_photoLibrary) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for UserAnalyticsUtilities();
  id v4 = a3;
  return [(PHAUserAnalyticsUtilities *)&v6 init];
}

- (BOOL)updateUserAnalyticsStreamWithProgressReporter:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_super v6 = self;
  sub_1D238453C();

  return 1;
}

- (PHAUserAnalyticsUtilities)init
{
  result = (PHAUserAnalyticsUtilities *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end