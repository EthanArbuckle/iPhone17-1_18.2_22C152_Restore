@interface MRDAutoConnectionControllerReason
+ (id)reasonWithType:(unint64_t)a3 string:(id)a4;
- (NSString)string;
- (id)description;
- (unint64_t)type;
- (void)setString:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation MRDAutoConnectionControllerReason

+ (id)reasonWithType:(unint64_t)a3 string:(id)a4
{
  id v5 = a4;
  v6 = objc_alloc_init(MRDAutoConnectionControllerReason);
  [(MRDAutoConnectionControllerReason *)v6 setType:a3];
  [(MRDAutoConnectionControllerReason *)v6 setString:v5];

  return v6;
}

- (id)description
{
  unint64_t type = self->_type;
  if (type > 4) {
    CFStringRef v3 = @"endpointChanged";
  }
  else {
    CFStringRef v3 = off_10041D3B0[type];
  }
  return +[NSString stringWithFormat:@"<MRDAutoConnectionControllerReason %@ - %@>", v3, self->_string];
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end