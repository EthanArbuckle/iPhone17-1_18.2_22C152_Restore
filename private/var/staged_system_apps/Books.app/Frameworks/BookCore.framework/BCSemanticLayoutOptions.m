@interface BCSemanticLayoutOptions
+ (id)current;
+ (id)fromJSON:(id)a3;
+ (id)logger;
- (BOOL)pageLabelOnLeft;
- (double)contentInsetTopLarge;
- (double)contentInsetTopMedium;
- (double)contentInsetTopSmall;
- (double)fontScale;
- (double)minCPLForSpreadPages;
- (double)scrollerScrubberHeight;
- (double)scrubberHeight;
- (double)scrubberWidth;
- (double)sideInsetFactor;
- (id)asJSON;
- (void)reset;
- (void)save;
- (void)setContentInsetTopLarge:(double)a3;
- (void)setContentInsetTopMedium:(double)a3;
- (void)setContentInsetTopSmall:(double)a3;
- (void)setFontScale:(double)a3;
- (void)setMinCPLForSpreadPages:(double)a3;
- (void)setPageLabelOnLeft:(BOOL)a3;
- (void)setScrubberHeight:(double)a3;
- (void)setScrubberWidth:(double)a3;
- (void)setSideInsetFactor:(double)a3;
- (void)setValuesFromDictionary:(id)a3;
@end

@implementation BCSemanticLayoutOptions

+ (id)current
{
  if (qword_345700 != -1) {
    dispatch_once(&qword_345700, &stru_2C6128);
  }
  v2 = (void *)qword_345708;

  return v2;
}

+ (id)logger
{
  if (qword_345718 != -1) {
    dispatch_once(&qword_345718, &stru_2C6148);
  }
  v2 = (void *)qword_345710;

  return v2;
}

- (void)reset
{
  [(BCSemanticLayoutOptions *)self setValuesFromDictionary:&__NSDictionary0__struct];

  [(BCSemanticLayoutOptions *)self save];
}

- (void)save
{
  id v4 = +[NSUserDefaults standardUserDefaults];
  v3 = [(BCSemanticLayoutOptions *)self asJSON];
  [v4 setObject:v3 forKey:@"kBKSemanticLayoutOptions_v3"];
}

+ (id)fromJSON:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [v4 dataUsingEncoding:4];

  if (v6)
  {
    id v11 = 0;
    v7 = +[NSJSONSerialization JSONObjectWithData:v6 options:0 error:&v11];
    id v8 = v11;
    if (v8)
    {

      v9 = [a1 logger];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_1EAFB4((uint64_t)v8, v9);
      }

      v7 = &__NSDictionary0__struct;
    }
  }
  else
  {
    id v8 = 0;
    v7 = 0;
  }
  [v5 setValuesFromDictionary:v7];

  return v5;
}

- (void)setValuesFromDictionary:(id)a3
{
  id v4 = a3;
  [(BCSemanticLayoutOptions *)self setFontScale:sub_6B708(v4, @"kBKSemanticLayoutOption_FontScale", 16.0)];
  [(BCSemanticLayoutOptions *)self setSideInsetFactor:sub_6B708(v4, @"kBKSemanticLayoutOption_SideInsetFactor", 0.085)];
  [(BCSemanticLayoutOptions *)self setMinCPLForSpreadPages:sub_6B708(v4, @"kBKSemanticLayoutOption_MinCPLForSpreadPages", 90.0)];
  [(BCSemanticLayoutOptions *)self setContentInsetTopSmall:sub_6B708(v4, @"kBKSemanticLayoutOption_ContentInsetTopSmall", 44.0)];
  [(BCSemanticLayoutOptions *)self setContentInsetTopMedium:sub_6B708(v4, @"kBKSemanticLayoutOption_ContentInsetTopMedium", 60.0)];
  [(BCSemanticLayoutOptions *)self setContentInsetTopLarge:sub_6B708(v4, @"kBKSemanticLayoutOption_ContentInsetTopLarge", 96.0)];
  [(BCSemanticLayoutOptions *)self setScrubberWidth:sub_6B708(v4, @"kBKSemanticLayoutOption_ScrubberWidth", 44.0)];
  double v5 = sub_6B708(v4, @"kBKSemanticLayoutOption_ScrubberHeight", 28.0);

  [(BCSemanticLayoutOptions *)self setScrubberHeight:v5];
}

- (double)scrollerScrubberHeight
{
  return 16.0;
}

- (id)asJSON
{
  v18[0] = @"kBKSemanticLayoutOption_FontScale";
  [(BCSemanticLayoutOptions *)self fontScale];
  v16 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v19[0] = v16;
  v18[1] = @"kBKSemanticLayoutOption_SideInsetFactor";
  [(BCSemanticLayoutOptions *)self sideInsetFactor];
  v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v19[1] = v15;
  v18[2] = @"kBKSemanticLayoutOption_MinCPLForSpreadPages";
  [(BCSemanticLayoutOptions *)self minCPLForSpreadPages];
  v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v19[2] = v3;
  v18[3] = @"kBKSemanticLayoutOption_ContentInsetTopSmall";
  [(BCSemanticLayoutOptions *)self contentInsetTopSmall];
  id v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v19[3] = v4;
  v18[4] = @"kBKSemanticLayoutOption_ContentInsetTopMedium";
  [(BCSemanticLayoutOptions *)self contentInsetTopMedium];
  double v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v19[4] = v5;
  v18[5] = @"kBKSemanticLayoutOption_ContentInsetTopLarge";
  [(BCSemanticLayoutOptions *)self contentInsetTopLarge];
  v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v19[5] = v6;
  v18[6] = @"kBKSemanticLayoutOption_ScrubberWidth";
  [(BCSemanticLayoutOptions *)self scrubberWidth];
  v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v19[6] = v7;
  v18[7] = @"kBKSemanticLayoutOption_ScrubberHeight";
  [(BCSemanticLayoutOptions *)self scrubberHeight];
  id v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v19[7] = v8;
  v9 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:8];
  id v17 = 0;
  v10 = +[NSJSONSerialization dataWithJSONObject:v9 options:0 error:&v17];
  id v11 = v17;

  if ([v10 length])
  {
    id v12 = [objc_alloc((Class)NSString) initWithData:v10 encoding:4];
  }
  else
  {
    v13 = [(id)objc_opt_class() logger];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_1EAFB4((uint64_t)v11, v13);
    }

    id v12 = 0;
  }

  return v12;
}

- (double)fontScale
{
  return self->_fontScale;
}

- (void)setFontScale:(double)a3
{
  self->_fontScale = a3;
}

- (double)sideInsetFactor
{
  return self->_sideInsetFactor;
}

- (void)setSideInsetFactor:(double)a3
{
  self->_sideInsetFactor = a3;
}

- (double)minCPLForSpreadPages
{
  return self->_minCPLForSpreadPages;
}

- (void)setMinCPLForSpreadPages:(double)a3
{
  self->_minCPLForSpreadPages = a3;
}

- (BOOL)pageLabelOnLeft
{
  return self->_pageLabelOnLeft;
}

- (void)setPageLabelOnLeft:(BOOL)a3
{
  self->_pageLabelOnLeft = a3;
}

- (double)scrubberWidth
{
  return self->_scrubberWidth;
}

- (void)setScrubberWidth:(double)a3
{
  self->_scrubberWidth = a3;
}

- (double)contentInsetTopSmall
{
  return self->_contentInsetTopSmall;
}

- (void)setContentInsetTopSmall:(double)a3
{
  self->_contentInsetTopSmall = a3;
}

- (double)contentInsetTopMedium
{
  return self->_contentInsetTopMedium;
}

- (void)setContentInsetTopMedium:(double)a3
{
  self->_contentInsetTopMedium = a3;
}

- (double)contentInsetTopLarge
{
  return self->_contentInsetTopLarge;
}

- (void)setContentInsetTopLarge:(double)a3
{
  self->_contentInsetTopLarge = a3;
}

- (double)scrubberHeight
{
  return self->_scrubberHeight;
}

- (void)setScrubberHeight:(double)a3
{
  self->_scrubberHeight = a3;
}

@end