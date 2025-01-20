@interface LibraryAnalytics
+ (void)captureAddOrEditNoteActionForPlaceMUID:(unint64_t)a3 isNewNote:(BOOL)a4;
+ (void)captureAddOrRemoveFromLibraryWithPlaceMUID:(unint64_t)a3 captureAdd:(BOOL)a4 target:(int)a5;
+ (void)captureAddOrRemovePinWithPlaceMUID:(unint64_t)a3 captureAdd:(BOOL)a4 target:(int)a5;
- (_TtC4Maps16LibraryAnalytics)init;
@end

@implementation LibraryAnalytics

+ (void)captureAddOrEditNoteActionForPlaceMUID:(unint64_t)a3 isNewNote:(BOOL)a4
{
}

+ (void)captureAddOrRemoveFromLibraryWithPlaceMUID:(unint64_t)a3 captureAdd:(BOOL)a4 target:(int)a5
{
}

+ (void)captureAddOrRemovePinWithPlaceMUID:(unint64_t)a3 captureAdd:(BOOL)a4 target:(int)a5
{
}

- (_TtC4Maps16LibraryAnalytics)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(LibraryAnalytics *)&v3 init];
}

@end