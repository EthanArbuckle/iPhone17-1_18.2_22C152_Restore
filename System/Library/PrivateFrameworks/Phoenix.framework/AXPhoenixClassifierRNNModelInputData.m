@interface AXPhoenixClassifierRNNModelInputData
- (AccelerometerBuffer)accelerometerBuffer;
- (NSArray)inputShape;
- (void)setAccelerometerBuffer:(id)a3;
- (void)setInputShape:(id)a3;
- (void)updateInputShape:(id)a3;
@end

@implementation AXPhoenixClassifierRNNModelInputData

- (void)updateInputShape:(id)a3
{
  v10[2] = *MEMORY[0x263EF8340];
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = (id)[location[0] objectAtIndexedSubscript:0];
  v10[0] = v7;
  v3 = NSNumber;
  id v6 = (id)[location[0] objectAtIndexedSubscript:1];
  id v5 = (id)objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v6, "unsignedIntegerValue"));
  v10[1] = v5;
  id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  -[AXPhoenixClassifierRNNModelInputData setInputShape:](v9, "setInputShape:");

  objc_storeStrong(location, 0);
}

- (NSArray)inputShape
{
  return self->_inputShape;
}

- (void)setInputShape:(id)a3
{
}

- (AccelerometerBuffer)accelerometerBuffer
{
  return self->_accelerometerBuffer;
}

- (void)setAccelerometerBuffer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end