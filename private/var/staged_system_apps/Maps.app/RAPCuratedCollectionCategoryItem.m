@interface RAPCuratedCollectionCategoryItem
- (NSString)localizedName;
- (RAPCuratedCollectionCategoryItem)initWithType:(unint64_t)a3;
- (id)titleForQuestionType:(unint64_t)a3;
- (unint64_t)type;
@end

@implementation RAPCuratedCollectionCategoryItem

- (RAPCuratedCollectionCategoryItem)initWithType:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)RAPCuratedCollectionCategoryItem;
  v4 = [(RAPCuratedCollectionCategoryItem *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    uint64_t v6 = [(RAPCuratedCollectionCategoryItem *)v4 titleForQuestionType:a3];
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v6;
  }
  return v5;
}

- (id)titleForQuestionType:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      v3 = +[NSBundle mainBundle];
      v4 = v3;
      CFStringRef v5 = @"[RAP Curated Collection] Broken Link";
      goto LABEL_7;
    case 2uLL:
      v3 = +[NSBundle mainBundle];
      v4 = v3;
      CFStringRef v5 = @"[RAP Curated Collection] Inaccurate Description";
      goto LABEL_7;
    case 3uLL:
      v3 = +[NSBundle mainBundle];
      v4 = v3;
      CFStringRef v5 = @"[RAP Curated Collection]";
      goto LABEL_7;
    case 4uLL:
      v3 = +[NSBundle mainBundle];
      v4 = v3;
      CFStringRef v5 = @"[RAP Curated Collection] Other";
LABEL_7:
      uint64_t v6 = [v3 localizedStringForKey:v5 value:@"localized string not found" table:0];

      break;
    default:
      uint64_t v6 = &stru_101324E70;
      break;
  }

  return v6;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void).cxx_destruct
{
}

@end