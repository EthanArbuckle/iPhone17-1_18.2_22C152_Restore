@interface VariablePillDrawer.CacheKey
- (BOOL)isEqual:(id)a3;
- (_TtCC14WorkflowUICore18VariablePillDrawerP33_9CD4534EC423F0CF964556D030CC849B8CacheKey)init;
- (int64_t)hash;
@end

@implementation VariablePillDrawer.CacheKey

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_2353EB378();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_2353FDC48();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_2353EB498((uint64_t)v8);

  sub_2353616F4((uint64_t)v8);
  return v6 & 1;
}

- (_TtCC14WorkflowUICore18VariablePillDrawerP33_9CD4534EC423F0CF964556D030CC849B8CacheKey)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC14WorkflowUICore18VariablePillDrawerP33_9CD4534EC423F0CF964556D030CC849B8CacheKey_font));
  int64_t v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCC14WorkflowUICore18VariablePillDrawerP33_9CD4534EC423F0CF964556D030CC849B8CacheKey_icon);
}

@end