@interface TVPMediaItemSkipInfo
- (NSString)localizedTitle;
- (NSString)skipIntroReportingType;
- (TVPMediaItemPromoInfo)promoInfo;
- (TVPMediaItemSkipInfo)initWithType:(unint64_t)a3 start:(double)a4 duration:(double)a5 target:(double)a6 localizedTitle:(id)a7 skipIntroReportingType:(id)a8;
- (double)duration;
- (double)start;
- (double)target;
- (id)_typeDescription;
- (id)description;
- (unint64_t)type;
- (void)setPromoInfo:(id)a3;
@end

@implementation TVPMediaItemSkipInfo

- (TVPMediaItemSkipInfo)initWithType:(unint64_t)a3 start:(double)a4 duration:(double)a5 target:(double)a6 localizedTitle:(id)a7 skipIntroReportingType:(id)a8
{
  id v14 = a7;
  id v15 = a8;
  v23.receiver = self;
  v23.super_class = (Class)TVPMediaItemSkipInfo;
  v16 = [(TVPMediaItemSkipInfo *)&v23 init];
  v17 = v16;
  if (v16)
  {
    v16->_type = a3;
    v16->_start = a4;
    v16->_duration = a5;
    v16->_target = a6;
    uint64_t v18 = [v14 copy];
    localizedTitle = v17->_localizedTitle;
    v17->_localizedTitle = (NSString *)v18;

    uint64_t v20 = [v15 copy];
    skipIntroReportingType = v17->_skipIntroReportingType;
    v17->_skipIntroReportingType = (NSString *)v20;
  }
  return v17;
}

- (id)description
{
  v3 = NSString;
  v4 = [(TVPMediaItemSkipInfo *)self _typeDescription];
  v5 = [v3 stringWithFormat:@"type - %@, start - %f, duration - %f target - %f", v4, *(void *)&self->_start, *(void *)&self->_duration, *(void *)&self->_target];

  return v5;
}

- (id)_typeDescription
{
  unint64_t v2 = [(TVPMediaItemSkipInfo *)self type];
  v3 = @"TVPMediaItemSkipTypeRecap";
  if (v2 != 2) {
    v3 = 0;
  }
  if (v2 == 1) {
    return @"TVPMediaItemSkipTypeIntro";
  }
  else {
    return v3;
  }
}

- (unint64_t)type
{
  return self->_type;
}

- (double)start
{
  return self->_start;
}

- (double)duration
{
  return self->_duration;
}

- (double)target
{
  return self->_target;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)skipIntroReportingType
{
  return self->_skipIntroReportingType;
}

- (TVPMediaItemPromoInfo)promoInfo
{
  return self->_promoInfo;
}

- (void)setPromoInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promoInfo, 0);
  objc_storeStrong((id *)&self->_skipIntroReportingType, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end