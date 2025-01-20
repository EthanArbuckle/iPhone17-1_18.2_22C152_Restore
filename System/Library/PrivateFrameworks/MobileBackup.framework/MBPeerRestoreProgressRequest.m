@interface MBPeerRestoreProgressRequest
- (MBPeerRestoreProgressRequest)initWithDictionary:(id)a3 error:(id *)a4;
- (MBPeerRestoreProgressRequest)initWithPercentage:(unint64_t)a3;
- (NSString)description;
- (id)dictionaryRepresentation;
- (unint64_t)percentage;
@end

@implementation MBPeerRestoreProgressRequest

- (MBPeerRestoreProgressRequest)initWithPercentage:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MBPeerRestoreProgressRequest;
  result = [(MBPeerRestoreProgressRequest *)&v5 init];
  if (result) {
    result->_percentage = a3;
  }
  return result;
}

- (MBPeerRestoreProgressRequest)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MBPeerRestoreProgressRequest;
  v7 = [(MBPeerRestoreProgressRequest *)&v12 init];
  if (!v7) {
    goto LABEL_4;
  }
  v8 = [v6 objectForKeyedSubscript:@"MBPercentage"];
  if (v8)
  {
    v9 = v8;
    v7->_percentage = (unint64_t)[v8 unsignedIntegerValue];

LABEL_4:
    v10 = v7;
    goto LABEL_5;
  }
  if (a4)
  {
    +[MBError errorWithCode:11, @"Failed to decode request. Missing property in dictionary %@", v6 format];
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
LABEL_5:

  return v10;
}

- (id)dictionaryRepresentation
{
  CFStringRef v5 = @"MBPercentage";
  v2 = +[NSNumber numberWithUnsignedInteger:[(MBPeerRestoreProgressRequest *)self percentage]];
  id v6 = v2;
  v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return v3;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  return +[NSString stringWithFormat:@"<%s: %p, p=%lu>", class_getName(v3), self, [(MBPeerRestoreProgressRequest *)self percentage]];
}

- (unint64_t)percentage
{
  return self->_percentage;
}

@end