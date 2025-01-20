@interface ICASHistogramItemData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASHistogramItemData)initWithLeftBound:(id)a3 rightBound:(id)a4 count:(id)a5;
- (NSNumber)count;
- (NSNumber)leftBound;
- (NSNumber)rightBound;
- (id)toDict;
@end

@implementation ICASHistogramItemData

- (ICASHistogramItemData)initWithLeftBound:(id)a3 rightBound:(id)a4 count:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICASHistogramItemData;
  v12 = [(ICASHistogramItemData *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_leftBound, a3);
    objc_storeStrong((id *)&v13->_rightBound, a4);
    objc_storeStrong((id *)&v13->_count, a5);
  }

  return v13;
}

+ (NSString)dataName
{
  return (NSString *)@"HistogramItemData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v14[0] = @"leftBound";
  v3 = [(ICASHistogramItemData *)self leftBound];
  if (v3)
  {
    uint64_t v4 = [(ICASHistogramItemData *)self leftBound];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v15[0] = v4;
  v14[1] = @"rightBound";
  v6 = [(ICASHistogramItemData *)self rightBound];
  if (v6)
  {
    uint64_t v7 = [(ICASHistogramItemData *)self rightBound];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v15[1] = v7;
  v14[2] = @"count";
  id v9 = [(ICASHistogramItemData *)self count];
  if (v9)
  {
    uint64_t v10 = [(ICASHistogramItemData *)self count];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
  }
  id v11 = (void *)v10;
  v15[2] = v10;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  return v12;
}

- (NSNumber)leftBound
{
  return self->_leftBound;
}

- (NSNumber)rightBound
{
  return self->_rightBound;
}

- (NSNumber)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_count, 0);
  objc_storeStrong((id *)&self->_rightBound, 0);
  objc_storeStrong((id *)&self->_leftBound, 0);
}

@end