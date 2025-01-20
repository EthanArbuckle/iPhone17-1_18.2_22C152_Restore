@interface SVAudioSessionConfiguration
- (BOOL)isEqualToConfiguration:(id)a3;
- (NSString)category;
- (NSString)mode;
- (SVAudioSessionConfiguration)initWithCategory:(id)a3 mode:(id)a4 policy:(unint64_t)a5;
- (unint64_t)routeSharingPolicy;
- (void)setCategory:(id)a3;
- (void)setMode:(id)a3;
- (void)setRouteSharingPolicy:(unint64_t)a3;
@end

@implementation SVAudioSessionConfiguration

- (SVAudioSessionConfiguration)initWithCategory:(id)a3 mode:(id)a4 policy:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SVAudioSessionConfiguration;
  v11 = [(SVAudioSessionConfiguration *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_category, a3);
    objc_storeStrong((id *)&v12->_mode, a4);
    v12->_routeSharingPolicy = a5;
  }

  return v12;
}

- (BOOL)isEqualToConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [(SVAudioSessionConfiguration *)self category];
  v6 = [v4 category];
  if ([v5 isEqualToString:v6])
  {
    v7 = [(SVAudioSessionConfiguration *)self mode];
    v8 = [v4 mode];
    if ([v7 isEqualToString:v8])
    {
      unint64_t v9 = [(SVAudioSessionConfiguration *)self routeSharingPolicy];
      BOOL v10 = v9 == [v4 routeSharingPolicy];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (NSString)mode
{
  return self->_mode;
}

- (void)setMode:(id)a3
{
}

- (unint64_t)routeSharingPolicy
{
  return self->_routeSharingPolicy;
}

- (void)setRouteSharingPolicy:(unint64_t)a3
{
  self->_routeSharingPolicy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mode, 0);

  objc_storeStrong((id *)&self->_category, 0);
}

@end