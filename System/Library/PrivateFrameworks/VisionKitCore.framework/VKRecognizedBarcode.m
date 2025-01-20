@interface VKRecognizedBarcode
- (CIBarcodeDescriptor)barcodeDescriptor;
- (NSString)payloadStringValue;
- (NSString)symbology;
- (VKRecognizedBarcode)initWithFrameInfo:(id)a3 barcodeObservation:(id)a4;
- (VNBarcodeObservation)observation;
- (id)description;
@end

@implementation VKRecognizedBarcode

- (VKRecognizedBarcode)initWithFrameInfo:(id)a3 barcodeObservation:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)VKRecognizedBarcode;
  return [(VKRecognizedItem *)&v5 initWithFrameInfo:a3 rectangleObservation:a4];
}

- (VNBarcodeObservation)observation
{
  uint64_t v3 = objc_opt_class();
  v7.receiver = self;
  v7.super_class = (Class)VKRecognizedBarcode;
  v4 = [(VKRecognizedItem *)&v7 observation];
  objc_super v5 = VKDynamicCast(v3, (uint64_t)v4);

  return (VNBarcodeObservation *)v5;
}

- (id)description
{
  uint64_t v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)VKRecognizedBarcode;
  v4 = [(VKRecognizedBarcode *)&v9 description];
  objc_super v5 = [(VKRecognizedBarcode *)self observation];
  v6 = [v5 payloadStringValue];
  objc_super v7 = [v3 stringWithFormat:@"%@ payload:%@", v4, v6];

  return v7;
}

- (NSString)symbology
{
  v2 = [(VKRecognizedBarcode *)self observation];
  uint64_t v3 = [v2 symbology];

  return (NSString *)v3;
}

- (CIBarcodeDescriptor)barcodeDescriptor
{
  v2 = [(VKRecognizedBarcode *)self observation];
  uint64_t v3 = [v2 barcodeDescriptor];

  return (CIBarcodeDescriptor *)v3;
}

- (NSString)payloadStringValue
{
  v2 = [(VKRecognizedBarcode *)self observation];
  uint64_t v3 = [v2 payloadStringValue];

  return (NSString *)v3;
}

@end