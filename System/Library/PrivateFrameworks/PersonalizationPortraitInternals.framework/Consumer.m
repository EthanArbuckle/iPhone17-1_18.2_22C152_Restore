@interface Consumer
- (_TtC32PersonalizationPortraitInternals8Consumer)init;
@end

@implementation Consumer

- (_TtC32PersonalizationPortraitInternals8Consumer)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC32PersonalizationPortraitInternals8Consumer_topicStoreOverride));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC32PersonalizationPortraitInternals8Consumer_entityStoreOverride));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC32PersonalizationPortraitInternals8Consumer_locationStoreOverride));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC32PersonalizationPortraitInternals8Consumer_writebackDissector));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC32PersonalizationPortraitInternals8Consumer_entityDissector));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC32PersonalizationPortraitInternals8Consumer_topicDissector);
}

@end