@interface FCHLSSegment
- (id)description;
@end

@implementation FCHLSSegment

- (id)description
{
  v2 = NSString;
  if (self)
  {
    v4 = self->_url;
    v5 = [NSNumber numberWithDouble:self->_duration];
    v6 = self->_map;
    v7 = @" Map: ";
    if (!v6) {
      v7 = &stru_1EF8299B8;
    }
    map = self->_map;
  }
  else
  {
    v5 = [NSNumber numberWithDouble:0.0];
    v6 = 0;
    v4 = 0;
    map = 0;
    v7 = &stru_1EF8299B8;
  }
  if (!map) {
    map = (FCHLSMap *)&stru_1EF8299B8;
  }
  v9 = [v2 stringWithFormat:@"%@ (%@s)%@%@", v4, v5, v7, map];

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_map, 0);
}

@end