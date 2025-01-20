@interface ISPlayerState
+ (id)outputInfoWithPhotoBlurRadius:(double)a3 videoAlpha:(double)a4 videoBlurRadius:(double)a5 label:(id)a6;
- (ISPlayerState)initWithPhotoBlurRadius:(double)a3 videoAlpha:(double)a4 videoBlurRadius:(double)a5 label:(id)a6;
- (NSString)diagnosticLabel;
- (double)photoBlurRadius;
- (double)videoAlpha;
- (double)videoBlurRadius;
- (id)description;
@end

@implementation ISPlayerState

- (double)videoAlpha
{
  return self->_videoAlpha;
}

- (ISPlayerState)initWithPhotoBlurRadius:(double)a3 videoAlpha:(double)a4 videoBlurRadius:(double)a5 label:(id)a6
{
  id v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)ISPlayerState;
  v11 = [(ISPlayerState *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_photoBlurRadius = a3;
    v11->_videoAlpha = a4;
    v11->_videoBlurRadius = a5;
    uint64_t v13 = [v10 copy];
    diagnosticLabel = v12->_diagnosticLabel;
    v12->_diagnosticLabel = (NSString *)v13;
  }
  return v12;
}

- (void).cxx_destruct
{
}

- (double)videoBlurRadius
{
  return self->_videoBlurRadius;
}

- (double)photoBlurRadius
{
  return self->_photoBlurRadius;
}

- (NSString)diagnosticLabel
{
  return self->_diagnosticLabel;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)ISPlayerState;
  v3 = [(ISPlayerState *)&v8 description];
  v4 = [v3 stringByAppendingFormat:@"\n\t\tlabel:\t\t%@", self->_diagnosticLabel];

  v5 = objc_msgSend(v4, "stringByAppendingFormat:", @"\n\t\tphoto:\t\t      b:%f", *(void *)&self->_photoBlurRadius);

  v6 = [v5 stringByAppendingFormat:@"\n\t\tvideo:\t\ta:%f, b:%f", *(void *)&self->_videoAlpha, *(void *)&self->_videoBlurRadius];

  return v6;
}

+ (id)outputInfoWithPhotoBlurRadius:(double)a3 videoAlpha:(double)a4 videoBlurRadius:(double)a5 label:(id)a6
{
  id v10 = a6;
  v11 = (void *)[objc_alloc((Class)a1) initWithPhotoBlurRadius:v10 videoAlpha:a3 videoBlurRadius:a4 label:a5];

  return v11;
}

@end