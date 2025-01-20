@interface PlaceSummaryTemplateFactory
+ (id)autocompleteTemplateWithCompletion:(id)a3 metadata:(id)a4;
+ (id)autocompleteTemplateWithSearchResult:(id)a3;
- (_TtC4Maps27PlaceSummaryTemplateFactory)init;
@end

@implementation PlaceSummaryTemplateFactory

+ (id)autocompleteTemplateWithSearchResult:(id)a3
{
  id v3 = a3;
  if ([v3 type] == 3) {
    id v4 = sub_1002669CC();
  }
  else {
    id v4 = sub_100265AE4(0);
  }
  v5 = v4;

  return v5;
}

+ (id)autocompleteTemplateWithCompletion:(id)a3 metadata:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = sub_100265FEC(v5, a4);

  return v7;
}

- (_TtC4Maps27PlaceSummaryTemplateFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PlaceSummaryTemplateFactory();
  return [(PlaceSummaryTemplateFactory *)&v3 init];
}

@end