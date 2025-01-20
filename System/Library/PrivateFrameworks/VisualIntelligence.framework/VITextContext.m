@interface VITextContext
- (NSArray)normalizedBoundingBoxes;
- (NSString)surroundingText;
- (VITextContext)initWithSurroundingText:(id)a3 normalizedBoundingBoxes:(id)a4;
@end

@implementation VITextContext

- (VITextContext)initWithSurroundingText:(id)a3 normalizedBoundingBoxes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VITextContext;
  v8 = [(VITextContext *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    surroundingText = v8->_surroundingText;
    v8->_surroundingText = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    normalizedBoundingBoxes = v8->_normalizedBoundingBoxes;
    v8->_normalizedBoundingBoxes = (NSArray *)v11;
  }
  return v8;
}

- (NSString)surroundingText
{
  return self->_surroundingText;
}

- (NSArray)normalizedBoundingBoxes
{
  return self->_normalizedBoundingBoxes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalizedBoundingBoxes, 0);
  objc_storeStrong((id *)&self->_surroundingText, 0);
}

@end