@interface SASTLocationListItem
+ (id)locationListItem;
- (SASTTemplateAction)action;
- (SASTTemplateStarRating)rating;
- (SAUIDecoratedText)formattedDistance;
- (SAUIDecoratedText)subtitle;
- (SAUIDecoratedText)title;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAction:(id)a3;
- (void)setFormattedDistance:(id)a3;
- (void)setRating:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SASTLocationListItem

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"LocationListItem";
}

+ (id)locationListItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SASTTemplateAction)action
{
  return (SASTTemplateAction *)AceObjectAceObjectForProperty(self, @"action");
}

- (void)setAction:(id)a3
{
}

- (SAUIDecoratedText)formattedDistance
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"formattedDistance");
}

- (void)setFormattedDistance:(id)a3
{
}

- (SASTTemplateStarRating)rating
{
  return (SASTTemplateStarRating *)AceObjectAceObjectForProperty(self, @"rating");
}

- (void)setRating:(id)a3
{
}

- (SAUIDecoratedText)subtitle
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"subtitle");
}

- (void)setSubtitle:(id)a3
{
}

- (SAUIDecoratedText)title
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"title");
}

- (void)setTitle:(id)a3
{
}

@end