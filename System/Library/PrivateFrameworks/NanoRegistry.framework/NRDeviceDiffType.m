@interface NRDeviceDiffType
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NRDeviceDiff)diff;
- (NRDeviceDiffType)initWithCoder:(id)a3;
- (NRDeviceDiffType)initWithDiff:(id)a3 andChangeType:(unint64_t)a4;
- (NRDeviceDiffType)initWithProtobuf:(id)a3;
- (NRPBDeviceDiffType)protobuf;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)changeType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NRDeviceDiffType

- (NRDeviceDiffType)initWithDiff:(id)a3 andChangeType:(unint64_t)a4
{
  id v7 = a3;
  v8 = [(NRDeviceDiffType *)self init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_diff, a3);
    v9->_changeType = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NRDeviceDiffType)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NRDeviceDiffType;
  v5 = [(NRDeviceDiffType *)&v13 init];
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
  if (!v6)
  {
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceDiff"];
    diff = v5->_diff;
    v5->_diff = (NRDeviceDiff *)v10;

    v5->_changeType = [v4 decodeIntegerForKey:@"changeType"];
LABEL_5:
    v9 = v5;
    goto LABEL_6;
  }
  id v7 = (void *)v6;
  v8 = [[NRPBDeviceDiffType alloc] initWithData:v6];
  v9 = [(NRDeviceDiffType *)v5 initWithProtobuf:v8];

LABEL_6:
  return v9;
}

- (NRDeviceDiffType)initWithProtobuf:(id)a3
{
  id v4 = (int *)a3;
  v14.receiver = self;
  v14.super_class = (Class)NRDeviceDiffType;
  v5 = [(NRDeviceDiffType *)&v14 init];
  uint64_t v6 = v5;
  if (v5)
  {
    if (!v4)
    {
      v5->_changeType = 0;
      v8 = [NRDeviceDiff alloc];
      v9 = 0;
      goto LABEL_7;
    }
    if ((v4[6] & 1) == 0)
    {
      v5->_changeType = 0;
LABEL_6:
      v8 = [NRDeviceDiff alloc];
      v9 = (void *)*((void *)v4 + 2);
LABEL_7:
      id v10 = v9;
      uint64_t v11 = [(NRDeviceDiff *)v8 initWithProtobuf:v10];
      diff = v6->_diff;
      v6->_diff = (NRDeviceDiff *)v11;

      goto LABEL_8;
    }
    unint64_t v7 = v4[2];
    v5->_changeType = v7;
    if (v7 != 2) {
      goto LABEL_6;
    }
  }
LABEL_8:

  return v6;
}

- (NRPBDeviceDiffType)protobuf
{
  uint64_t v3 = objc_opt_new();
  id v4 = [(NRDeviceDiff *)self->_diff protobuf];
  -[NRPBDeviceDiffType setDiff:](v3, v4);

  if (v3)
  {
    unint64_t changeType = self->_changeType;
    *(unsigned char *)(v3 + 24) |= 1u;
    *(_DWORD *)(v3 + 8) = changeType;
  }

  return (NRPBDeviceDiffType *)(id)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(NRDeviceDiffType *)self protobuf];
  v5 = [v6 data];
  [v4 encodeObject:v5 forKey:@"data"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NRDeviceDiffType allocWithZone:a3] init];
  objc_storeStrong((id *)&v4->_diff, self->_diff);
  v4->_unint64_t changeType = self->_changeType;
  return v4;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NRDeviceDiff *)self->_diff hash];
  return self->_changeType - v3 + 32 * v3 + 961;
}

- (id)description
{
  diff = self->_diff;
  if (diff)
  {
    if (self->_changeType) {
      unint64_t v3 = @"[UPDATED]";
    }
    else {
      unint64_t v3 = @"[CREATED]";
    }
    id v4 = v3;
    v5 = [(NRDeviceDiff *)diff description];
    id v6 = +[NRTextFormattingUtilities prefixLinesWithString:v4 withText:v5];
  }
  else
  {
    id v6 = @"[DELETED]";
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NRDeviceDiffType *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_7;
  }
  if (v4 == self)
  {
    char v7 = 1;
    goto LABEL_12;
  }
  if (v4)
  {
    v5 = v4;
    if (self->_changeType == v5->_changeType)
    {
      diff = self->_diff;
      if (diff == v5->_diff) {
        char v7 = 1;
      }
      else {
        char v7 = -[NRDeviceDiff isEqual:](diff, "isEqual:");
      }
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
LABEL_7:
    char v7 = 0;
  }
LABEL_12:

  return v7;
}

- (NRDeviceDiff)diff
{
  return self->_diff;
}

- (unint64_t)changeType
{
  return self->_changeType;
}

- (void).cxx_destruct
{
}

@end