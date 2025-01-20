@interface SearchUIWatchListButtonRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)isHorizontallySrollingStyle;
- (NSString)identifier;
- (int)type;
- (unint64_t)hash;
- (void)setIdentifier:(id)a3;
- (void)setIsHorizontallySrollingStyle:(BOOL)a3;
- (void)setType:(int)a3;
@end

@implementation SearchUIWatchListButtonRequest

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(SearchUIWatchListButtonRequest *)self identifier];
    v6 = [v4 identifier];
    if ([v5 isEqual:v6]
      && (int v7 = -[SearchUIWatchListButtonRequest type](self, "type"), v7 == [v4 type]))
    {
      BOOL v8 = [(SearchUIWatchListButtonRequest *)self isHorizontallySrollingStyle];
      int v9 = v8 ^ [v4 isHorizontallySrollingStyle] ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [(SearchUIWatchListButtonRequest *)self identifier];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = v4 ^ [(SearchUIWatchListButtonRequest *)self type];
  unint64_t v6 = v5 ^ [(SearchUIWatchListButtonRequest *)self isHorizontallySrollingStyle];

  return v6;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (BOOL)isHorizontallySrollingStyle
{
  return self->_isHorizontallySrollingStyle;
}

- (void)setIsHorizontallySrollingStyle:(BOOL)a3
{
  self->_isHorizontallySrollingStyle = a3;
}

- (void).cxx_destruct
{
}

@end