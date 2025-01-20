@interface VKCMockDataDetectorElement
- (VKCMockDataDetectorElement)initWithDictionary:(id)a3;
- (_NSRange)characterRange;
- (id)boundingQuads;
- (unint64_t)dataDetectorTypes;
@end

@implementation VKCMockDataDetectorElement

- (VKCMockDataDetectorElement)initWithDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VKCMockDataDetectorElement;
  v5 = [(VKCBaseDataDetectorElement *)&v19 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:VKCMockResultDataDetectorTypesKey];
    v5->_dataDetectorTypes = [v6 unsignedLongLongValue];

    uint64_t v7 = [v4 objectForKeyedSubscript:VKCMockResultDataDetectorQuadsKey];
    v8 = (void *)v7;
    v9 = (void *)MEMORY[0x1E4F1CBF0];
    if (v7) {
      v9 = (void *)v7;
    }
    id v10 = v9;

    uint64_t v11 = objc_msgSend(v10, "vk_compactMap:", &__block_literal_global_17);

    boundingQuads = v5->_boundingQuads;
    v5->_boundingQuads = (NSArray *)v11;

    v13 = [v4 objectForKeyedSubscript:VKCMockResultDataDetectorRangeKey];
    v14 = [v13 objectForKeyedSubscript:VKCMockResultRangeLocationKey];
    uint64_t v15 = [v14 unsignedLongValue];

    v16 = [v13 objectForKeyedSubscript:VKCMockResultRangeLengthKey];
    uint64_t v17 = [v16 unsignedLongValue];

    v5->_characterRange.location = v15;
    v5->_characterRange.length = v17;
  }
  return v5;
}

VKQuad *__49__VKCMockDataDetectorElement_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[VKQuad alloc] initWithDictionary:v2];

  return v3;
}

- (unint64_t)dataDetectorTypes
{
  return self->_dataDetectorTypes;
}

- (_NSRange)characterRange
{
  p_characterRange = &self->_characterRange;
  NSUInteger location = self->_characterRange.location;
  NSUInteger length = p_characterRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (id)boundingQuads
{
  return self->_boundingQuads;
}

- (void).cxx_destruct
{
}

@end