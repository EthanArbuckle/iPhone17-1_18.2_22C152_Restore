@interface JSAFeedMetadata
+ (id)metadataDictionary:(id)a3 variationWithNavigationBarStyle:(unint64_t)a4;
+ (id)metadataDictionary:(id)a3 variationWithNavigationBarVisibile:(BOOL)a4;
- (BOOL)navigationBarVisible;
- (BOOL)showsVerticalScrollIndicator;
- (JSAFeedMetadata)init;
- (JSAFeedMetadata)initWithDictionary:(id)a3;
- (NSArray)messagePlacements;
- (NSString)accessibilitySummary;
- (NSString)backTitle;
- (NSString)title;
- (NSString)trackerName;
- (UIColor)dayBackgroundColor;
- (UIColor)navigationBarTintColor;
- (UIColor)nightBackgroundColor;
- (UIEdgeInsets)navigationBarLayoutInsets;
- (double)navigationBarInitialBackgroundOpacity;
- (unint64_t)navigationBarStyle;
@end

@implementation JSAFeedMetadata

- (JSAFeedMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v62.receiver = self;
  v62.super_class = (Class)JSAFeedMetadata;
  v5 = [(JSAFeedMetadata *)&v62 init];
  v6 = v5;
  if (v5)
  {
    v5->_navigationBarVisible = 1;
    v5->_navigationBarStyle = 0;
    v5->_navigationBarInitialBackgroundOpacity = 1.0;
    if (v4)
    {
      v7 = [v4 objectForKeyedSubscript:@"navigationBarVisibility"];
      if (v7)
      {
        v8 = [v4 objectForKeyedSubscript:@"navigationBarVisibility"];
        v6->_navigationBarVisible = [v8 BOOLValue];
      }
      else
      {
        v6->_navigationBarVisible = 1;
      }

      v9 = [v4 objectForKeyedSubscript:@"showsVerticalScrollIndicator"];
      if (v9)
      {
        objc_opt_class();
        v10 = [v4 objectForKeyedSubscript:@"showsVerticalScrollIndicator"];
        v11 = BUDynamicCast();
        v6->_showsVerticalScrollIndicator = [v11 BOOLValue];
      }
      else
      {
        v6->_showsVerticalScrollIndicator = 1;
      }

      id v12 = [v4 objectForKeyedSubscript:@"navigationBarStyle"];
      if ([v12 isEqualToString:@"transparent"])
      {
        uint64_t v13 = 2;
      }
      else if ([v12 isEqualToString:@"small"])
      {
        uint64_t v13 = 1;
      }
      else if ([v12 isEqualToString:@"transparent-with-insets"])
      {
        uint64_t v13 = 3;
      }
      else if ([v12 isEqualToString:@"transparent-always"])
      {
        uint64_t v13 = 4;
      }
      else
      {
        uint64_t v13 = 0;
      }

      v6->_navigationBarStyle = v13;
      v14 = [v4 objectForKeyedSubscript:@"navigationBarInitialBackgroundOpacity"];
      if (v14)
      {
        v15 = [v4 objectForKeyedSubscript:@"navigationBarInitialBackgroundOpacity"];
        [v15 doubleValue];
        v6->_navigationBarInitialBackgroundOpacity = v16;
      }
      else
      {
        v6->_navigationBarInitialBackgroundOpacity = 1.0;
      }

      v17 = [v4 objectForKeyedSubscript:@"navigationBarTintOpacity"];
      double v18 = 1.0;
      double v19 = 1.0;
      if (v17)
      {
        v20 = [v4 objectForKeyedSubscript:@"navigationBarTintOpacity"];
        [v20 doubleValue];
        double v19 = v21;
      }
      v22 = [v4 objectForKeyedSubscript:@"navigationBarTintColor"];
      uint64_t v23 = +[UIColor jsa_colorWithHexString:v22 alpha:v19];
      navigationBarTintColor = v6->_navigationBarTintColor;
      v6->_navigationBarTintColor = (UIColor *)v23;

      v25 = [v4 objectForKeyedSubscript:@"dayBackgroundOpacity"];
      if (v25)
      {
        v26 = [v4 objectForKeyedSubscript:@"dayBackgroundOpacity"];
        [v26 doubleValue];
        double v18 = v27;
      }
      v28 = [v4 objectForKeyedSubscript:@"dayBackgroundColor"];
      uint64_t v29 = +[UIColor jsa_colorWithHexString:v28 alpha:v18];
      dayBackgroundColor = v6->_dayBackgroundColor;
      v6->_dayBackgroundColor = (UIColor *)v29;

      v31 = [v4 objectForKeyedSubscript:@"nightBackgroundOpacity"];
      if (v31)
      {
        v32 = [v4 objectForKeyedSubscript:@"nightBackgroundOpacity"];
        [v32 doubleValue];
        double v34 = v33;
      }
      else
      {
        double v34 = 1.0;
      }

      v35 = [v4 objectForKeyedSubscript:@"nightBackgroundColor"];
      uint64_t v36 = +[UIColor jsa_colorWithHexString:v35 alpha:v34];
      nightBackgroundColor = v6->_nightBackgroundColor;
      v6->_nightBackgroundColor = (UIColor *)v36;

      objc_opt_class();
      v38 = [v4 objectForKeyedSubscript:@"backTitle"];
      v39 = BUDynamicCast();
      v40 = (NSString *)[v39 copy];
      backTitle = v6->_backTitle;
      v6->_backTitle = v40;

      objc_opt_class();
      v42 = [v4 objectForKeyedSubscript:@"title"];
      v43 = BUDynamicCast();
      v44 = (NSString *)[v43 copy];
      title = v6->_title;
      v6->_title = v44;

      objc_opt_class();
      v46 = [v4 objectForKeyedSubscript:@"trackerName"];
      v47 = BUDynamicCast();
      v48 = (NSString *)[v47 copy];
      trackerName = v6->_trackerName;
      v6->_trackerName = v48;

      objc_opt_class();
      v50 = [v4 objectForKeyedSubscript:@"accessibilitySummary"];
      v51 = BUDynamicCast();
      v52 = (NSString *)[v51 copy];
      accessibilitySummary = v6->_accessibilitySummary;
      v6->_accessibilitySummary = v52;

      objc_opt_class();
      v54 = [v4 objectForKeyedSubscript:@"messagePlacements"];
      v55 = BUDynamicCast();
      v56 = (NSArray *)[v55 copy];
      messagePlacements = v6->_messagePlacements;
      v6->_messagePlacements = v56;

      objc_opt_class();
      v58 = [v4 objectForKeyedSubscript:@"navigationBarHorizontalLayoutInset"];
      v59 = BUDynamicCast();

      if (v59)
      {
        [v59 doubleValue];
        v6->_navigationBarLayoutInsets.top = 0.0;
        v6->_navigationBarLayoutInsets.left = v60;
        v6->_navigationBarLayoutInsets.bottom = 0.0;
        v6->_navigationBarLayoutInsets.right = v60;
      }
    }
  }

  return v6;
}

- (JSAFeedMetadata)init
{
  v3.receiver = self;
  v3.super_class = (Class)JSAFeedMetadata;
  result = [(JSAFeedMetadata *)&v3 init];
  if (result)
  {
    result->_navigationBarVisible = 1;
    result->_navigationBarStyle = 0;
    result->_navigationBarInitialBackgroundOpacity = 1.0;
  }
  return result;
}

+ (id)metadataDictionary:(id)a3 variationWithNavigationBarStyle:(unint64_t)a4
{
  id v5 = a3;
  v6 = v5;
  if (v5) {
    id v7 = [v5 mutableCopy];
  }
  else {
    id v7 = (id)objc_opt_new();
  }
  v8 = v7;
  if (a4 <= 4) {
    [v7 setObject:off_B2530[a4] forKeyedSubscript:@"navigationBarStyle"];
  }
  id v9 = [v8 copy];

  return v9;
}

+ (id)metadataDictionary:(id)a3 variationWithNavigationBarVisibile:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3) {
    id v5 = [a3 mutableCopy];
  }
  else {
    id v5 = (id)objc_opt_new();
  }
  v6 = v5;
  id v7 = +[NSNumber numberWithBool:v4];
  [v6 setObject:v7 forKeyedSubscript:@"navigationBarVisibility"];

  id v8 = [v6 copy];

  return v8;
}

- (BOOL)navigationBarVisible
{
  return self->_navigationBarVisible;
}

- (BOOL)showsVerticalScrollIndicator
{
  return self->_showsVerticalScrollIndicator;
}

- (unint64_t)navigationBarStyle
{
  return self->_navigationBarStyle;
}

- (double)navigationBarInitialBackgroundOpacity
{
  return self->_navigationBarInitialBackgroundOpacity;
}

- (UIColor)navigationBarTintColor
{
  return self->_navigationBarTintColor;
}

- (UIColor)dayBackgroundColor
{
  return self->_dayBackgroundColor;
}

- (UIColor)nightBackgroundColor
{
  return self->_nightBackgroundColor;
}

- (NSString)backTitle
{
  return self->_backTitle;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)trackerName
{
  return self->_trackerName;
}

- (UIEdgeInsets)navigationBarLayoutInsets
{
  double top = self->_navigationBarLayoutInsets.top;
  double left = self->_navigationBarLayoutInsets.left;
  double bottom = self->_navigationBarLayoutInsets.bottom;
  double right = self->_navigationBarLayoutInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (NSArray)messagePlacements
{
  return self->_messagePlacements;
}

- (NSString)accessibilitySummary
{
  return self->_accessibilitySummary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilitySummary, 0);
  objc_storeStrong((id *)&self->_messagePlacements, 0);
  objc_storeStrong((id *)&self->_trackerName, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_backTitle, 0);
  objc_storeStrong((id *)&self->_nightBackgroundColor, 0);
  objc_storeStrong((id *)&self->_dayBackgroundColor, 0);

  objc_storeStrong((id *)&self->_navigationBarTintColor, 0);
}

@end