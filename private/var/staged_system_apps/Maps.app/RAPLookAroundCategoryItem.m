@interface RAPLookAroundCategoryItem
+ (id)_titleForQuestionType:(unint64_t)a3;
- (NSString)localizedName;
- (RAPLookAroundCategoryItem)initWithType:(unint64_t)a3;
- (int)analyticAction;
- (unint64_t)type;
@end

@implementation RAPLookAroundCategoryItem

- (RAPLookAroundCategoryItem)initWithType:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)RAPLookAroundCategoryItem;
  v4 = [(RAPLookAroundCategoryItem *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    uint64_t v6 = +[RAPLookAroundCategoryItem _titleForQuestionType:a3];
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v6;
  }
  return v5;
}

- (int)analyticAction
{
  unint64_t type = self->_type;
  if (type > 6) {
    return 17099;
  }
  else {
    return dword_100F73530[type];
  }
}

+ (id)_titleForQuestionType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      v4 = +[NSBundle mainBundle];
      v5 = v4;
      CFStringRef v6 = @"[RAP LookAround] Image quality should be better";
      goto LABEL_9;
    case 1uLL:
      v4 = +[NSBundle mainBundle];
      v5 = v4;
      CFStringRef v6 = @"[RAP LookAround] Street or other labels are incorrect";
      goto LABEL_9;
    case 2uLL:
      v4 = +[NSBundle mainBundle];
      v5 = v4;
      CFStringRef v6 = @"[RAP LookAround] Store labels are incorrect";
      goto LABEL_9;
    case 3uLL:
      v4 = +[NSBundle mainBundle];
      v5 = v4;
      CFStringRef v6 = @"[RAP LookAround] Privacy Concerns";
      goto LABEL_9;
    case 4uLL:
      v4 = +[NSBundle mainBundle];
      v5 = v4;
      CFStringRef v6 = @"[RAP LookAround] Obscure personal information";
      goto LABEL_9;
    case 5uLL:
      v4 = +[NSBundle mainBundle];
      v5 = v4;
      CFStringRef v6 = @"[RAP LookAround] Obscure imagery of my home";
      goto LABEL_9;
    case 6uLL:
      v4 = +[NSBundle mainBundle];
      v5 = v4;
      CFStringRef v6 = @"[RAP LookAround] Something else needs fixing";
LABEL_9:
      v3 = [v4 localizedStringForKey:v6 value:@"localized string not found" table:0];

      break;
    default:
      break;
  }

  return v3;
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