@interface VKLabelExternalIconElement
+ (BOOL)supportsSecureCoding;
- (VKLabelExternalIconElement)initWithCoder:(id)a3;
- (VKLabelExternalIconElement)initWithIconElement:(const void *)a3;
- (const)element;
- (id).cxx_construct;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VKLabelExternalIconElement

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((_WORD *)self + 12) = 1;
  return self;
}

- (const)element
{
  return &self->_element;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  *(float *)&double v5 = self->_element.size._e[0];
  id v9 = v4;
  [v4 encodeFloat:@"sizeX" forKey:v5];
  *(float *)&double v6 = self->_element.size._e[1];
  [v9 encodeFloat:@"sizeY" forKey:v6];
  *(float *)&double v7 = self->_element.anchorPoint._e[0];
  [v9 encodeFloat:@"anchorPointX" forKey:v7];
  *(float *)&double v8 = self->_element.anchorPoint._e[1];
  [v9 encodeFloat:@"anchorPointY" forKey:v8];
  [v9 encodeBool:self->_element.isRound forKey:@"isRound"];
  [v9 encodeInt32:self->_element.minZoom forKey:@"minZoom"];
}

- (VKLabelExternalIconElement)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VKLabelExternalIconElement;
  double v5 = [(VKLabelExternalIconElement *)&v11 init];
  if (v5)
  {
    [v4 decodeFloatForKey:@"sizeX"];
    v5->_element.size._e[0] = v6;
    [v4 decodeFloatForKey:@"sizeY"];
    v5->_element.size._e[1] = v7;
    [v4 decodeFloatForKey:@"anchorPointX"];
    v5->_element.anchorPoint._e[0] = v8;
    [v4 decodeFloatForKey:@"anchorPointY"];
    v5->_element.anchorPoint._e[1] = v9;
    v5->_element.isRound = [v4 decodeBoolForKey:@"isRound"];
    v5->_element.minZoom = [v4 decodeInt32ForKey:@"minZoom"];
  }

  return v5;
}

- (VKLabelExternalIconElement)initWithIconElement:(const void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VKLabelExternalIconElement;
  result = [(VKLabelExternalIconElement *)&v5 init];
  if (result)
  {
    result->_element.size._e[0] = *(float *)a3;
    result->_element.size._e[1] = *((float *)a3 + 1);
    result->_element.anchorPoint._e[0] = *((float *)a3 + 2);
    result->_element.anchorPoint._e[1] = *((float *)a3 + 3);
    *(_WORD *)&result->_element.isRound = *((_WORD *)a3 + 8);
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end