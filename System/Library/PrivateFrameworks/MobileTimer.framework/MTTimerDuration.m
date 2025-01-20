@interface MTTimerDuration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDuration:(id)a3;
- (MTSound)sound;
- (MTTimerDuration)initWithCoder:(id)a3;
- (MTTimerDuration)initWithTitle:(id)a3 duration:(double)a4;
- (MTTimerDuration)initWithTitle:(id)a3 duration:(double)a4 sound:(id)a5;
- (MTTimerDuration)initWithTitle:(id)a3 duration:(double)a4 sound:(id)a5 lastModified:(id)a6;
- (NSDate)lastModified;
- (NSString)description;
- (NSString)title;
- (double)duration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)hashString;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDuration:(double)a3;
- (void)setLastModified:(id)a3;
- (void)setSound:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation MTTimerDuration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sound, 0);
  objc_storeStrong((id *)&self->_lastModified, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(MTTimerDuration *)self title];
  [(MTTimerDuration *)self duration];
  uint64_t v6 = v5;
  v7 = [(MTTimerDuration *)self lastModified];
  v8 = [v3 stringWithFormat:@"duration with title: %@, duration: %f, lastModified: %@", v4, v6, v7];

  return (NSString *)v8;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28ED0];
  id v5 = a3;
  [(MTTimerDuration *)self duration];
  uint64_t v6 = objc_msgSend(v4, "numberWithDouble:");
  [v5 encodeObject:v6 forKey:@"kMTTimerDurationInterval"];

  v7 = [(MTTimerDuration *)self title];
  [v5 encodeObject:v7 forKey:@"kMTTimerDurationTitle"];

  v8 = [(MTTimerDuration *)self lastModified];
  [v5 encodeObject:v8 forKey:@"kMTTimerDurationLastModified"];

  id v9 = [(MTTimerDuration *)self sound];
  [v5 encodeObject:v9 forKey:@"kMTTimerDurationSound"];
}

- (NSString)title
{
  return self->_title;
}

- (NSDate)lastModified
{
  return self->_lastModified;
}

- (double)duration
{
  return self->_duration;
}

- (MTSound)sound
{
  return self->_sound;
}

- (MTTimerDuration)initWithTitle:(id)a3 duration:(double)a4 sound:(id)a5 lastModified:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)MTTimerDuration;
  v13 = [(MTTimerDuration *)&v17 init];
  v14 = v13;
  if (v13)
  {
    [(MTTimerDuration *)v13 setTitle:v10];
    [(MTTimerDuration *)v14 setDuration:a4];
    [(MTTimerDuration *)v14 setLastModified:v12];
    if (v11)
    {
      [(MTTimerDuration *)v14 setSound:v11];
    }
    else
    {
      v15 = +[MTSound defaultSoundForCategory:1];
      [(MTTimerDuration *)v14 setSound:v15];
    }
  }

  return v14;
}

- (MTTimerDuration)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MTTimerDuration;
  id v5 = [(MTTimerDuration *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMTTimerDurationInterval"];
    [v6 doubleValue];
    -[MTTimerDuration setDuration:](v5, "setDuration:");
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMTTimerDurationTitle"];
    [(MTTimerDuration *)v5 setTitle:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMTTimerDurationLastModified"];
    [(MTTimerDuration *)v5 setLastModified:v8];

    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMTTimerDurationSound"];
    [(MTTimerDuration *)v5 setSound:v9];
  }
  return v5;
}

- (void)setTitle:(id)a3
{
}

- (void)setSound:(id)a3
{
}

- (void)setLastModified:(id)a3
{
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (MTTimerDuration)initWithTitle:(id)a3 duration:(double)a4 sound:(id)a5
{
  v8 = (void *)MEMORY[0x1E4F1C9C8];
  id v9 = a5;
  id v10 = a3;
  objc_super v11 = [v8 date];
  id v12 = [(MTTimerDuration *)self initWithTitle:v10 duration:v9 sound:v11 lastModified:a4];

  return v12;
}

- (MTTimerDuration)initWithTitle:(id)a3 duration:(double)a4
{
  return [(MTTimerDuration *)self initWithTitle:a3 duration:0 sound:a4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MTTimerDuration *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    id v5 = v4;
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    v7 = v6;

    if (v7) {
      BOOL v8 = [(MTTimerDuration *)self isEqualToDuration:v7];
    }
    else {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (BOOL)isEqualToDuration:(id)a3
{
  id v4 = a3;
  [(MTTimerDuration *)self duration];
  double v6 = v5;
  [v4 duration];
  if (v6 == v7)
  {
    BOOL v8 = [(MTTimerDuration *)self title];
    id v9 = [v4 title];
    BOOL v10 = [v8 caseInsensitiveCompare:v9] == 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = [(MTTimerDuration *)self hashString];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)hashString
{
  unint64_t v3 = objc_opt_new();
  id v4 = [(MTTimerDuration *)self title];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    double v6 = [(MTTimerDuration *)self title];
    double v7 = [v6 lowercaseString];
    [v3 appendFormat:@"%@", v7];
  }
  [(MTTimerDuration *)self duration];
  objc_msgSend(v3, "appendFormat:", @"%f", v8);
  id v9 = (void *)[v3 copy];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [MTTimerDuration alloc];
  uint64_t v5 = [(MTTimerDuration *)self title];
  [(MTTimerDuration *)self duration];
  double v7 = v6;
  uint64_t v8 = [(MTTimerDuration *)self sound];
  id v9 = [(MTTimerDuration *)self lastModified];
  BOOL v10 = [(MTTimerDuration *)v4 initWithTitle:v5 duration:v8 sound:v9 lastModified:v7];

  return v10;
}

@end