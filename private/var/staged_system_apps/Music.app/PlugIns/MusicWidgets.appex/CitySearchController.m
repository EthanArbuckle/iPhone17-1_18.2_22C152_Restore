@interface CitySearchController
- (_TtC11MusicCoreUIP33_66D9DE5C50A23191A347FA0B4F8C41B820CitySearchController)init;
@end

@implementation CitySearchController

- (_TtC11MusicCoreUIP33_66D9DE5C50A23191A347FA0B4F8C41B820CitySearchController)init
{
  return (_TtC11MusicCoreUIP33_66D9DE5C50A23191A347FA0B4F8C41B820CitySearchController *)sub_10042A918();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11MusicCoreUIP33_66D9DE5C50A23191A347FA0B4F8C41B820CitySearchController__query;
  uint64_t v4 = sub_10000BB04(&qword_100673708);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self
     + OBJC_IVAR____TtC11MusicCoreUIP33_66D9DE5C50A23191A347FA0B4F8C41B820CitySearchController__completionResults;
  uint64_t v6 = sub_10000BB04(&qword_100673700);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11MusicCoreUIP33_66D9DE5C50A23191A347FA0B4F8C41B820CitySearchController_searchCompleter);
}

@end