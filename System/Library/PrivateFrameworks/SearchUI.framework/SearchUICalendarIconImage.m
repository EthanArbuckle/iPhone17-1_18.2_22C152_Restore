@interface SearchUICalendarIconImage
- (BOOL)isCurrentDate;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (SearchUICalendarIconImage)initWithCurrentDateAndVariant:(unint64_t)a3;
- (SearchUICalendarIconImage)initWithDate:(id)a3 variant:(unint64_t)a4;
- (id)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4;
- (unint64_t)hash;
- (void)setDate:(id)a3;
- (void)setIsCurrentDate:(BOOL)a3;
@end

@implementation SearchUICalendarIconImage

- (SearchUICalendarIconImage)initWithCurrentDateAndVariant:(unint64_t)a3
{
  [(SearchUICalendarIconImage *)self setIsCurrentDate:1];
  return [(SearchUICalendarIconImage *)self initWithDate:0 variant:a3];
}

- (SearchUICalendarIconImage)initWithDate:(id)a3 variant:(unint64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SearchUICalendarIconImage;
  v7 = [(SearchUIAppIconImage *)&v10 initWithBundleIdentifier:0 variant:a4 contentType:0];
  v8 = v7;
  if (v7) {
    [(SearchUICalendarIconImage *)v7 setDate:v6];
  }

  return v8;
}

- (id)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4
{
  if ([(SearchUICalendarIconImage *)self isCurrentDate]) {
    [MEMORY[0x1E4F1C9C8] now];
  }
  else {
  id v6 = [(SearchUICalendarIconImage *)self date];
  }
  id v7 = objc_alloc(MEMORY[0x1E4F6F248]);
  v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v9 = [(SearchUIAppIconImage *)self bundleIdentifier];
  objc_super v10 = (void *)[v7 initWithDate:v6 calendar:v8 format:v9 == 0];

  v11 = [(SearchUIAppIconImage *)self descriptorWithScale:a3];
  v12 = [(id)objc_opt_class() imageForIcon:v10 descriptor:v11];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SearchUICalendarIconImage;
  if ([(SearchUIAppIconImage *)&v11 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v6 = [(SearchUICalendarIconImage *)self date];
    id v7 = [v4 date];
    if ([v5 isDate:v6 inSameDayAsDate:v7])
    {
      BOOL v8 = [(SearchUICalendarIconImage *)self isCurrentDate];
      int v9 = v8 ^ [v4 isCurrentDate] ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v4 = [(SearchUICalendarIconImage *)self date];
  v5 = [v3 components:30 fromDate:v4];
  uint64_t v6 = [v5 hash];
  uint64_t v7 = [(SearchUICalendarIconImage *)self isCurrentDate];
  v10.receiver = self;
  v10.super_class = (Class)SearchUICalendarIconImage;
  unint64_t v8 = v6 ^ v7 ^ [(SearchUIAppIconImage *)&v10 hash];

  return v8;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (BOOL)isCurrentDate
{
  return self->_isCurrentDate;
}

- (void)setIsCurrentDate:(BOOL)a3
{
  self->_isCurrentDate = a3;
}

- (void).cxx_destruct
{
}

@end