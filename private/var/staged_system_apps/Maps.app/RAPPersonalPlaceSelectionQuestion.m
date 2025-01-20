@interface RAPPersonalPlaceSelectionQuestion
- (MapsSuggestionsShortcut)shortcut;
- (NSString)localizedDescription;
- (NSString)localizedTitle;
- (RAPPersonalPlaceSelectionQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 shortcut:(id)a5;
- (UIImage)image;
- (int)userAction;
- (int64_t)questionCategory;
@end

@implementation RAPPersonalPlaceSelectionQuestion

- (RAPPersonalPlaceSelectionQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 shortcut:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)RAPPersonalPlaceSelectionQuestion;
  v10 = [(RAPQuestion *)&v13 initWithReport:a3 parentQuestion:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_shortcut, a5);
  }

  return v11;
}

- (int64_t)questionCategory
{
  return 0;
}

- (int)userAction
{
  return 0;
}

- (UIImage)image
{
  id v2 = [(MapsSuggestionsShortcut *)self->_shortcut type];

  return (UIImage *)sub_100653868((uint64_t)v2);
}

- (NSString)localizedTitle
{
  id v2 = [(MapsSuggestionsShortcut *)self->_shortcut geoMapItem];
  v3 = [v2 addressObject];
  v4 = [v3 name];

  return (NSString *)v4;
}

- (NSString)localizedDescription
{
  id v2 = [(MapsSuggestionsShortcut *)self->_shortcut geoMapItem];
  v3 = [v2 addressObject];
  v4 = [v3 shortAddress];

  return (NSString *)v4;
}

- (MapsSuggestionsShortcut)shortcut
{
  return self->_shortcut;
}

- (void).cxx_destruct
{
}

@end