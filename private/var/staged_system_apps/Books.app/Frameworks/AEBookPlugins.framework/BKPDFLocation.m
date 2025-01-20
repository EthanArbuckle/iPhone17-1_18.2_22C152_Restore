@interface BKPDFLocation
+ (BOOL)supportsSecureCoding;
+ (id)deserializeLocationFromDictionary:(id)a3;
+ (id)locationForSelection:(id)a3 offset:(unint64_t)a4;
- (BKPDFLocation)initWithCoder:(id)a3;
- (BKPDFLocation)initWithLocationDictionary:(id)a3;
- (NSData)serialData;
- (PDFSelection)selection;
- (id)serialString;
- (id)serializeLocationToDictionary;
- (id)stringValue;
- (void)encodeWithCoder:(id)a3;
- (void)setSelection:(id)a3;
- (void)setSerialData:(id)a3;
@end

@implementation BKPDFLocation

+ (id)locationForSelection:(id)a3 offset:(unint64_t)a4
{
  id v5 = a3;
  v6 = [(BKPageLocation *)[BKPDFLocation alloc] initWithOrdinal:0 andOffset:a4];
  [(BKPDFLocation *)v6 setSelection:v5];
  v7 = [v5 html];

  v8 = sub_9E59C(v7);
  [(BKPDFLocation *)v6 setSerialData:v8];

  return v6;
}

- (BKPDFLocation)initWithLocationDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"super"];
  v10.receiver = self;
  v10.super_class = (Class)BKPDFLocation;
  v6 = [(BKPageLocation *)&v10 initWithLocationDictionary:v5];
  if (v6)
  {
    uint64_t v7 = [v4 objectForKey:@"serialData"];
    serialData = v6->_serialData;
    v6->_serialData = (NSData *)v7;
  }
  return v6;
}

- (id)serializeLocationToDictionary
{
  v11.receiver = self;
  v11.super_class = (Class)BKPDFLocation;
  v3 = [(BKPageLocation *)&v11 serializeLocationToDictionary];
  id v4 = [(BKPDFLocation *)self selection];

  if (v4)
  {
    id v5 = [(BKPDFLocation *)self selection];
    v6 = [v5 html];

    uint64_t v7 = sub_9E59C(v6);
    [(BKPDFLocation *)self setSerialData:v7];
  }
  if (v3 && (serialData = self->_serialData) != 0)
  {
    v9 = +[NSDictionary dictionaryWithObjectsAndKeys:v3, @"super", serialData, @"serialData", @"BKPDFLocation", @"class", 0];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)deserializeLocationFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:@"class"];
  if ([v4 isEqualToString:@"BKPDFLocation"]) {
    id v5 = [[BKPDFLocation alloc] initWithLocationDictionary:v3];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)stringValue
{
  v7.receiver = self;
  v7.super_class = (Class)BKPDFLocation;
  id v3 = [(BKPageLocation *)&v7 stringValue];
  id v4 = [(BKPDFLocation *)self serialString];
  id v5 = +[NSString stringWithFormat:@"{ %@, serialString: %@ }", v3, v4];

  return v5;
}

- (id)serialString
{
  id v3 = [(BKPDFLocation *)self serialData];

  if (v3)
  {
    id v4 = [(BKPDFLocation *)self serialData];
    id v5 = (size_t *)[v4 bytes];
    objc_super v7 = (Bytef *)(v5 + 1);
    size_t v6 = *v5;
    v8 = (Bytef *)malloc_type_malloc(*v5, 0xA077D0C0uLL);
    *(_OWORD *)&v11.avail_in = 0u;
    memset(&v11.total_out, 0, 72);
    v11.next_in = v7;
    v11.avail_in = v6;
    v11.next_out = v8;
    *(void *)&v11.avail_out = v6;
    id v9 = 0;
    if (!inflateInit_(&v11, "1.2.12", 112))
    {
      if (inflate(&v11, 4) == 1) {
        id v9 = [objc_alloc((Class)NSString) initWithBytes:v8 length:v6 encoding:4];
      }
      else {
        id v9 = 0;
      }
      inflateEnd(&v11);
      free(v8);
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (BKPDFLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKPDFLocation;
  id v5 = [(BKPageLocation *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serialData"];
    serialData = v5->_serialData;
    v5->_serialData = (NSData *)v6;

    [(BKPDFLocation *)v5 setSelection:0];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKPDFLocation;
  id v4 = a3;
  [(BKPageLocation *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_serialData forKey:@"serialData"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDFSelection)selection
{
  return self->_selection;
}

- (void)setSelection:(id)a3
{
}

- (NSData)serialData
{
  return self->_serialData;
}

- (void)setSerialData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialData, 0);

  objc_storeStrong((id *)&self->_selection, 0);
}

@end