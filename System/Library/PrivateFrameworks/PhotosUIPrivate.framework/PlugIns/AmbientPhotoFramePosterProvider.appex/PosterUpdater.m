@interface PosterUpdater
- (_TtC31AmbientPhotoFramePosterProvider13PosterUpdater)init;
- (void)updateConfiguration:(PRPosterConfiguration *)a3 withSessionInfo:(PRUpdatingSessionInfo *)a4 completion:(id)a5;
- (void)updateDescriptors:(NSDictionary *)a3 withSessionInfo:(PRUpdatingSessionInfo *)a4 completion:(id)a5;
@end

@implementation PosterUpdater

- (void)updateDescriptors:(NSDictionary *)a3 withSessionInfo:(PRUpdatingSessionInfo *)a4 completion:(id)a5
{
}

- (void)updateConfiguration:(PRPosterConfiguration *)a3 withSessionInfo:(PRUpdatingSessionInfo *)a4 completion:(id)a5
{
}

- (_TtC31AmbientPhotoFramePosterProvider13PosterUpdater)init
{
  return (_TtC31AmbientPhotoFramePosterProvider13PosterUpdater *)sub_10000F364();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31AmbientPhotoFramePosterProvider13PosterUpdater____lazy_storage___photoLibrary));
}

@end