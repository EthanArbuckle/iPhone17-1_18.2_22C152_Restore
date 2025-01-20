@interface PPNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNotification:(id)a3;
- (NSDate)date;
- (NSString)bundleId;
- (NSString)message;
- (NSString)subtitle;
- (NSString)title;
- (PPNotification)initWithBundleId:(id)a3 title:(id)a4 subtitle:(id)a5 message:(id)a6 date:(id)a7;
- (PPNotification)initWithCoder:(id)a3;
- (PPNotification)initWithCurrentDateAndBundleId:(id)a3 title:(id)a4 subtitle:(id)a5 message:(id)a6;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPNotification

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)message
{
  return self->_message;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<PPNotification: bundleId: %@ title.length: %tu subtitle.length %tu message.length: %tu>", self->_bundleId, -[NSString length](self->_title, "length"), -[NSString length](self->_subtitle, "length"), -[NSString length](self->_message, "length")];
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PPNotification *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PPNotification *)self isEqualToNotification:v4];
  }

  return v5;
}

- (BOOL)isEqualToNotification:(id)a3
{
  v4 = (PPNotification *)a3;
  p_isa = (id *)&v4->super.isa;
  if (v4 == self)
  {
    LOBYTE(v9) = 1;
  }
  else if (v4)
  {
    v6 = self->_bundleId;
    unint64_t v7 = (unint64_t)p_isa[1];
    if (!((unint64_t)v6 | v7)) {
      goto LABEL_7;
    }
    v8 = (void *)v7;
    LOBYTE(v9) = 0;
    if (!v6 || !v7) {
      goto LABEL_29;
    }
    int v9 = [(NSDate *)v6 isEqualToString:v7];

    if (v9)
    {
LABEL_7:
      v6 = self->_title;
      unint64_t v10 = (unint64_t)p_isa[2];
      if ((unint64_t)v6 | v10)
      {
        v8 = (void *)v10;
        LOBYTE(v9) = 0;
        if (!v6 || !v10) {
          goto LABEL_29;
        }
        int v9 = [(NSDate *)v6 isEqualToString:v10];

        if (!v9) {
          goto LABEL_30;
        }
      }
      v6 = self->_subtitle;
      unint64_t v11 = (unint64_t)p_isa[3];
      if ((unint64_t)v6 | v11)
      {
        v8 = (void *)v11;
        LOBYTE(v9) = 0;
        if (!v6 || !v11) {
          goto LABEL_29;
        }
        int v9 = [(NSDate *)v6 isEqualToString:v11];

        if (!v9) {
          goto LABEL_30;
        }
      }
      v6 = self->_message;
      unint64_t v12 = (unint64_t)p_isa[4];
      if (!((unint64_t)v6 | v12))
      {
LABEL_10:
        v6 = self->_date;
        unint64_t v13 = (unint64_t)p_isa[5];
        if ((unint64_t)v6 | v13)
        {
          v8 = (void *)v13;
          LOBYTE(v9) = 0;
          if (v6 && v13) {
            LOBYTE(v9) = [(NSDate *)v6 isEqualToDate:v13];
          }
        }
        else
        {
          v8 = 0;
          v6 = 0;
          LOBYTE(v9) = 1;
        }
        goto LABEL_29;
      }
      v8 = (void *)v12;
      LOBYTE(v9) = 0;
      if (v6 && v12)
      {
        int v9 = [(NSDate *)v6 isEqualToString:v12];

        if (!v9) {
          goto LABEL_30;
        }
        goto LABEL_10;
      }
LABEL_29:
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }
LABEL_30:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleId hash];
  NSUInteger v4 = [(NSString *)self->_title hash] - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_subtitle hash] - v4 + 32 * v4;
  NSUInteger v6 = [(NSString *)self->_message hash] - v5 + 32 * v5;
  return [(NSDate *)self->_date hash] - v6 + 32 * v6;
}

- (void)encodeWithCoder:(id)a3
{
  bundleId = self->_bundleId;
  id v5 = a3;
  [v5 encodeObject:bundleId forKey:@"bid"];
  [v5 encodeObject:self->_title forKey:@"tit"];
  [v5 encodeObject:self->_subtitle forKey:@"sub"];
  [v5 encodeObject:self->_message forKey:@"mes"];
  [v5 encodeObject:self->_date forKey:@"date"];
}

- (PPNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bid"];
  NSUInteger v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tit"];
  unint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sub"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mes"];
  int v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];

  if (v5 && v8 && v9)
  {
    self = [(PPNotification *)self initWithBundleId:v5 title:v6 subtitle:v7 message:v8 date:v9];
    unint64_t v10 = self;
  }
  else
  {
    unint64_t v11 = pp_default_log_handle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unint64_t v13 = 0;
      _os_log_error_impl(&dword_18CAA6000, v11, OS_LOG_TYPE_ERROR, "PPNotification:initWithCoder: decoded illegal nil property", v13, 2u);
    }

    unint64_t v10 = 0;
  }

  return v10;
}

- (PPNotification)initWithBundleId:(id)a3 title:(id)a4 subtitle:(id)a5 message:(id)a6 date:(id)a7
{
  id v13 = a3;
  id v24 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v13)
  {
    if (v15) {
      goto LABEL_3;
    }
LABEL_8:
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PPNotification.m", 38, @"Invalid parameter not satisfying: %@", @"message" object file lineNumber description];

    if (v16) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"PPNotification.m", 37, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];

  if (!v15) {
    goto LABEL_8;
  }
LABEL_3:
  if (v16) {
    goto LABEL_4;
  }
LABEL_9:
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"PPNotification.m", 39, @"Invalid parameter not satisfying: %@", @"date" object file lineNumber description];

LABEL_4:
  v25.receiver = self;
  v25.super_class = (Class)PPNotification;
  v17 = [(PPNotification *)&v25 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_bundleId, a3);
    objc_storeStrong((id *)&v18->_title, a4);
    objc_storeStrong((id *)&v18->_subtitle, a5);
    objc_storeStrong((id *)&v18->_message, a6);
    objc_storeStrong((id *)&v18->_date, a7);
  }

  return v18;
}

- (PPNotification)initWithCurrentDateAndBundleId:(id)a3 title:(id)a4 subtitle:(id)a5 message:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_opt_new();
  id v15 = [(PPNotification *)self initWithBundleId:v13 title:v12 subtitle:v11 message:v10 date:v14];

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end