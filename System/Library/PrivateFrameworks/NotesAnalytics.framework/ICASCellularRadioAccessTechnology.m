@interface ICASCellularRadioAccessTechnology
- (ICASCellularRadioAccessTechnology)initWithCellularRadioAccessTechnology:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)cellularRadioAccessTechnology;
@end

@implementation ICASCellularRadioAccessTechnology

- (ICASCellularRadioAccessTechnology)initWithCellularRadioAccessTechnology:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASCellularRadioAccessTechnology;
  result = [(ICASCellularRadioAccessTechnology *)&v5 init];
  if (result) {
    result->_cellularRadioAccessTechnology = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASCellularRadioAccessTechnology *)self cellularRadioAccessTechnology];
  if ((unint64_t)(v3 - 1) > 2) {
    return @"unknown";
  }
  else {
    return off_1E64B92B0[v3 - 1];
  }
}

- (int64_t)cellularRadioAccessTechnology
{
  return self->_cellularRadioAccessTechnology;
}

@end