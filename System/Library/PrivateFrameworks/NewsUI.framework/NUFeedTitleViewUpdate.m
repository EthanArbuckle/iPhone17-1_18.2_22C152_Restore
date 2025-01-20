@interface NUFeedTitleViewUpdate
+ (id)feedTitleViewUpdateCheckingForNewStoriesForType:(unint64_t)a3;
+ (id)feedTitleViewUpdateCheckingForUpdatesForType:(unint64_t)a3;
+ (id)feedTitleViewUpdateEmptyState;
+ (id)feedTitleViewUpdateEmptyStateForType:(unint64_t)a3;
+ (id)feedTitleViewUpdateForAttributedText:(id)a3;
+ (id)feedTitleViewUpdateForAttributedText:(id)a3 forType:(unint64_t)a4;
+ (id)feedTitleViewUpdateForCheckingForNewStories;
+ (id)feedTitleViewUpdateForCheckingForUpdates;
+ (id)feedTitleViewUpdateForFeedImage:(id)a3 accessibilityTitle:(id)a4;
+ (id)feedTitleViewUpdateForFeedName:(id)a3;
+ (id)feedTitleViewUpdateForNewStoriesWithStoryCount:(unint64_t)a3;
+ (id)feedTitleViewUpdateNewStoriesWithStoryForType:(unint64_t)a3 storyCount:(unint64_t)a4;
+ (id)feedTitleViewUpdateNewStoriesWithStoryForType:(unint64_t)a3 storyCount:(unint64_t)a4 linger:(BOOL)a5;
- (BOOL)isEqual:(id)a3;
- (NSAttributedString)attributedText;
- (NSString)accessibilityTitle;
- (NSString)feedName;
- (NUFeedTitleViewUpdate)init;
- (NUFeedTitleViewUpdate)initWithType:(unint64_t)a3 updateType:(unint64_t)a4;
- (UIImage)feedImage;
- (double)lingerTimeInterval;
- (id)convertToTitleViewUpdateWithCompact:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)storyCount;
- (unint64_t)type;
- (unint64_t)updateType;
- (void)setAccessibilityTitle:(id)a3;
- (void)setAttributedText:(id)a3;
- (void)setFeedImage:(id)a3;
- (void)setFeedName:(id)a3;
- (void)setLingerTimeInterval:(double)a3;
- (void)setStoryCount:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation NUFeedTitleViewUpdate

+ (id)feedTitleViewUpdateForAttributedText:(id)a3 forType:(unint64_t)a4
{
  id v5 = a3;
  v6 = [[NUFeedTitleViewUpdate alloc] initWithType:a4 updateType:0];
  [(NUFeedTitleViewUpdate *)v6 setAttributedText:v5];

  return v6;
}

- (void)setAttributedText:(id)a3
{
}

- (NUFeedTitleViewUpdate)initWithType:(unint64_t)a3 updateType:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NUFeedTitleViewUpdate;
  result = [(NUFeedTitleViewUpdate *)&v7 init];
  if (result)
  {
    result->_type = a3;
    result->_updateType = a4;
    result->_lingerTimeInterval = 0.0;
  }
  return result;
}

- (NSString)accessibilityTitle
{
  return self->_accessibilityTitle;
}

- (id)convertToTitleViewUpdateWithCompact:(BOOL)a3
{
  BOOL v4 = a3;
  switch([(NUFeedTitleViewUpdate *)self updateType])
  {
    case 0uLL:
      v6 = [(NUFeedTitleViewUpdate *)self feedImage];

      if (v6)
      {
        objc_super v7 = [NUTitleViewUpdate alloc];
        v8 = [(NUFeedTitleViewUpdate *)self feedImage];
        uint64_t v9 = [(NUTitleViewUpdate *)v7 initWithImage:v8];
      }
      else
      {
        v22 = [(NUFeedTitleViewUpdate *)self attributedText];

        if (v22)
        {
          v23 = [NUTitleViewUpdate alloc];
          v8 = [(NUFeedTitleViewUpdate *)self attributedText];
          uint64_t v9 = [(NUTitleViewUpdate *)v23 initWithAttributedText:v8 styleType:0];
        }
        else
        {
          v24 = [(NUFeedTitleViewUpdate *)self feedName];

          if (!v24)
          {
            v3 = objc_alloc_init(NUTitleViewUpdate);
            goto LABEL_21;
          }
          v25 = [NUTitleViewUpdate alloc];
          v8 = [(NUFeedTitleViewUpdate *)self feedName];
          uint64_t v9 = [(NUTitleViewUpdate *)v25 initWithText:v8 styleType:0];
        }
      }
      v3 = (NUTitleViewUpdate *)v9;

LABEL_21:
      [(NUTitleViewUpdate *)v3 setSpeakAccessibilityTitleWhenDisplayed:0];
      v13 = [(NUFeedTitleViewUpdate *)self accessibilityTitle];
      [(NUTitleViewUpdate *)v3 setAccessibilityTitle:v13];
      goto LABEL_22;
    case 1uLL:
      if (v4 && ![(NUFeedTitleViewUpdate *)self type])
      {
        v10 = NUBundle();
        v11 = v10;
        v12 = @"Checking for stories…";
      }
      else
      {
        v10 = NUBundle();
        v11 = v10;
        v12 = @"Checking for new stories…";
      }
      goto LABEL_8;
    case 2uLL:
      v10 = NUBundle();
      v11 = v10;
      v12 = @"Checking for updates…";
LABEL_8:
      v13 = [v10 localizedStringForKey:v12 value:&stru_26D495918 table:0];

      v3 = [[NUTitleViewUpdate alloc] initWithText:v13 styleType:1];
      [(NUTitleViewUpdate *)v3 setCancelPendingUpdates:1];
      v14 = [(NUFeedTitleViewUpdate *)self accessibilityTitle];
      [(NUTitleViewUpdate *)v3 setAccessibilityTitle:v14];

      [(NUTitleViewUpdate *)v3 setTextAlignment:[(NUFeedTitleViewUpdate *)self type] == 0];
      goto LABEL_22;
    case 3uLL:
      unint64_t v15 = [(NUFeedTitleViewUpdate *)self storyCount];
      v16 = NUBundle();
      v17 = v16;
      if (v15 <= 1) {
        v18 = @"New story";
      }
      else {
        v18 = @"New stories";
      }
      v13 = [v16 localizedStringForKey:v18 value:&stru_26D495918 table:0];

      id v19 = +[NUImages newStoriesArrow];
      v3 = [[NUTitleViewUpdate alloc] initWithText:v13 styleType:1 glyph:v19];
      if ([(NUFeedTitleViewUpdate *)self type] == 1)
      {
        v20 = [(NUTitleViewUpdate *)v3 value];
        [v20 setAlignment:1];
      }
      [(NUFeedTitleViewUpdate *)self lingerTimeInterval];
      -[NUTitleViewUpdate setLingerTimeInterval:](v3, "setLingerTimeInterval:");
      [(NUTitleViewUpdate *)v3 setCancelPendingUpdates:1];
      v21 = [(NUFeedTitleViewUpdate *)self accessibilityTitle];
      [(NUTitleViewUpdate *)v3 setAccessibilityTitle:v21];

LABEL_22:
      goto LABEL_23;
    default:
LABEL_23:
      return v3;
  }
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (unint64_t)updateType
{
  return self->_updateType;
}

- (UIImage)feedImage
{
  return self->_feedImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedImage, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_feedName, 0);

  objc_storeStrong((id *)&self->_accessibilityTitle, 0);
}

+ (id)feedTitleViewUpdateEmptyState
{
  return (id)[a1 feedTitleViewUpdateEmptyStateForType:0];
}

+ (id)feedTitleViewUpdateEmptyStateForType:(unint64_t)a3
{
  v3 = [[NUFeedTitleViewUpdate alloc] initWithType:a3 updateType:0];

  return v3;
}

+ (id)feedTitleViewUpdateForFeedName:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[NUFeedTitleViewUpdate alloc] initWithType:0 updateType:0];
  [(NUFeedTitleViewUpdate *)v4 setFeedName:v3];
  [(NUFeedTitleViewUpdate *)v4 setAccessibilityTitle:v3];

  return v4;
}

+ (id)feedTitleViewUpdateForAttributedText:(id)a3
{
  return (id)[a1 feedTitleViewUpdateForAttributedText:a3 forType:0];
}

+ (id)feedTitleViewUpdateForFeedImage:(id)a3 accessibilityTitle:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_super v7 = [[NUFeedTitleViewUpdate alloc] initWithType:0 updateType:0];
  [(NUFeedTitleViewUpdate *)v7 setFeedImage:v6];

  [(NUFeedTitleViewUpdate *)v7 setAccessibilityTitle:v5];

  return v7;
}

+ (id)feedTitleViewUpdateForCheckingForNewStories
{
  return (id)[a1 feedTitleViewUpdateCheckingForNewStoriesForType:0];
}

+ (id)feedTitleViewUpdateCheckingForNewStoriesForType:(unint64_t)a3
{
  id v3 = [[NUFeedTitleViewUpdate alloc] initWithType:a3 updateType:1];

  return v3;
}

+ (id)feedTitleViewUpdateForCheckingForUpdates
{
  return (id)[a1 feedTitleViewUpdateCheckingForUpdatesForType:0];
}

+ (id)feedTitleViewUpdateCheckingForUpdatesForType:(unint64_t)a3
{
  id v3 = [[NUFeedTitleViewUpdate alloc] initWithType:a3 updateType:2];

  return v3;
}

+ (id)feedTitleViewUpdateForNewStoriesWithStoryCount:(unint64_t)a3
{
  return (id)[a1 feedTitleViewUpdateNewStoriesWithStoryForType:0 storyCount:a3];
}

+ (id)feedTitleViewUpdateNewStoriesWithStoryForType:(unint64_t)a3 storyCount:(unint64_t)a4
{
  id v5 = [[NUFeedTitleViewUpdate alloc] initWithType:a3 updateType:3];
  [(NUFeedTitleViewUpdate *)v5 setStoryCount:a4];
  [(NUFeedTitleViewUpdate *)v5 setLingerTimeInterval:3.0];

  return v5;
}

+ (id)feedTitleViewUpdateNewStoriesWithStoryForType:(unint64_t)a3 storyCount:(unint64_t)a4 linger:(BOOL)a5
{
  BOOL v5 = a5;
  objc_super v7 = [[NUFeedTitleViewUpdate alloc] initWithType:a3 updateType:3];
  [(NUFeedTitleViewUpdate *)v7 setStoryCount:a4];
  double v8 = 0.0;
  if (v5) {
    double v8 = 3.0;
  }
  [(NUFeedTitleViewUpdate *)v7 setLingerTimeInterval:v8];

  return v7;
}

- (NUFeedTitleViewUpdate)init
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = [[NUFeedTitleViewUpdate alloc] initWithType:[(NUFeedTitleViewUpdate *)self type] updateType:[(NUFeedTitleViewUpdate *)self updateType]];
  [(NUFeedTitleViewUpdate *)v5 setStoryCount:[(NUFeedTitleViewUpdate *)self storyCount]];
  id v6 = [(NUFeedTitleViewUpdate *)self feedName];
  objc_super v7 = (void *)[v6 copyWithZone:a3];
  [(NUFeedTitleViewUpdate *)v5 setFeedName:v7];

  double v8 = [(NUFeedTitleViewUpdate *)self feedImage];
  [(NUFeedTitleViewUpdate *)v5 setFeedImage:v8];

  [(NUFeedTitleViewUpdate *)self lingerTimeInterval];
  -[NUFeedTitleViewUpdate setLingerTimeInterval:](v5, "setLingerTimeInterval:");
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (NUFeedTitleViewUpdate *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = v4;
      unint64_t v6 = [(NUFeedTitleViewUpdate *)self type];
      if (v6 == [(NUFeedTitleViewUpdate *)v5 type]
        && (unint64_t v7 = [(NUFeedTitleViewUpdate *)self updateType],
            v7 == [(NUFeedTitleViewUpdate *)v5 updateType])
        && ([(NUFeedTitleViewUpdate *)self lingerTimeInterval],
            double v9 = v8,
            [(NUFeedTitleViewUpdate *)v5 lingerTimeInterval],
            v9 == v10))
      {
        if ([(NUFeedTitleViewUpdate *)self updateType])
        {
          char v11 = 1;
        }
        else
        {
          v13 = (void *)MEMORY[0x263F8C6D0];
          v14 = [(NUFeedTitleViewUpdate *)self feedImage];
          unint64_t v15 = [(NUFeedTitleViewUpdate *)v5 feedImage];
          if (objc_msgSend(v13, "nf_object:isEqualToObject:", v14, v15))
          {
            char v11 = 1;
          }
          else
          {
            v16 = (void *)MEMORY[0x263F8C6D0];
            v17 = [(NUFeedTitleViewUpdate *)self feedImage];
            v18 = [(NUFeedTitleViewUpdate *)v5 feedImage];
            char v11 = objc_msgSend(v16, "nf_object:isEqualToObject:", v17, v18);
          }
        }
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (void)setAccessibilityTitle:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)storyCount
{
  return self->_storyCount;
}

- (void)setStoryCount:(unint64_t)a3
{
  self->_storyCount = a3;
}

- (NSString)feedName
{
  return self->_feedName;
}

- (void)setFeedName:(id)a3
{
}

- (void)setFeedImage:(id)a3
{
}

- (double)lingerTimeInterval
{
  return self->_lingerTimeInterval;
}

- (void)setLingerTimeInterval:(double)a3
{
  self->_lingerTimeInterval = a3;
}

@end