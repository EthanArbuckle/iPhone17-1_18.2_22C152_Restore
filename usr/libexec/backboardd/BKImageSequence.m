@interface BKImageSequence
- (BKImageSequence)initWithBasename:(id)a3 bundle:(id)a4 imageCount:(int64_t)a5 scale:(double)a6;
- (CGImage)_createImageForIndex:(unint64_t)a3 basename:(id)a4 scale:(double)a5 idiom:(id)a6 bundle:(id)a7;
- (CGImage)_imageAtIndex:(int64_t)a3;
- (NSBundle)bundle;
- (NSPointerArray)images;
- (NSString)basename;
- (NSString)idiomSuffix;
- (double)scale;
- (id)_idiomSuffix;
- (id)allImages;
- (int64_t)maximumImageCount;
- (void)_loadAllImages;
- (void)setBasename:(id)a3;
- (void)setBundle:(id)a3;
- (void)setIdiomSuffix:(id)a3;
- (void)setImages:(id)a3;
@end

@implementation BKImageSequence

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idiomSuffix, 0);
  objc_storeStrong((id *)&self->_basename, 0);
  objc_storeStrong((id *)&self->_bundle, 0);

  objc_storeStrong((id *)&self->_images, 0);
}

- (void)setIdiomSuffix:(id)a3
{
}

- (NSString)idiomSuffix
{
  return self->_idiomSuffix;
}

- (void)setBasename:(id)a3
{
}

- (NSString)basename
{
  return self->_basename;
}

- (void)setBundle:(id)a3
{
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setImages:(id)a3
{
}

- (NSPointerArray)images
{
  return self->_images;
}

- (double)scale
{
  return self->_scale;
}

- (int64_t)maximumImageCount
{
  return self->_maximumImageCount;
}

- (void)_loadAllImages
{
  if (self->_maximumImageCount >= 1)
  {
    int64_t v3 = 0;
    do
      [(BKImageSequence *)self _imageAtIndex:v3++];
    while (v3 < self->_maximumImageCount);
  }
}

- (CGImage)_imageAtIndex:(int64_t)a3
{
  if (self->_maximumImageCount <= a3)
  {
    v11 = +[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"imageIndex < _maximumImageCount"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v12 = NSStringFromSelector(a2);
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138544642;
      *(void *)v16 = v12;
      *(_WORD *)&v16[8] = 2114;
      *(void *)&v16[10] = v14;
      *(_WORD *)&v16[18] = 2048;
      *(void *)&v16[20] = self;
      __int16 v17 = 2114;
      CFStringRef v18 = @"BKImageSequence.m";
      __int16 v19 = 1024;
      int v20 = 116;
      __int16 v21 = 2114;
      v22 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x10004A96CLL);
  }
  v5 = -[NSPointerArray pointerAtIndex:](self->_images, "pointerAtIndex:");
  if (!v5)
  {
    v5 = [(BKImageSequence *)self _createImageForIndex:a3 basename:self->_basename scale:self->_idiomSuffix idiom:self->_bundle bundle:self->_scale];
    if (v5
      || [(NSString *)self->_idiomSuffix length]
      && (v5 = [(BKImageSequence *)self _createImageForIndex:a3 basename:self->_basename scale:&stru_1000FD108 idiom:self->_bundle bundle:self->_scale]) != 0)
    {
      [(NSPointerArray *)self->_images replacePointerAtIndex:a3 withPointer:v5];
      CGImageRelease(v5);
    }
    else
    {
      v6 = sub_10005F9DC();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        basename = self->_basename;
        double scale = self->_scale;
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v16 = &index;
        *(_WORD *)&v16[4] = 2114;
        *(void *)&v16[6] = basename;
        *(_WORD *)&v16[14] = 2048;
        *(double *)&v16[16] = scale;
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "missing image index:%d basename:%{public}@ scale:%g", buf, 0x1Cu);
      }

      return 0;
    }
  }
  return v5;
}

- (id)_idiomSuffix
{
  return &stru_1000FD108;
}

- (CGImage)_createImageForIndex:(unint64_t)a3 basename:(id)a4 scale:(double)a5 idiom:(id)a6 bundle:(id)a7
{
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  v14 = sub_10005F9DC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v27 = a3;
    *(_WORD *)&v27[4] = 2114;
    *(void *)&v27[6] = v11;
    *(_WORD *)&v27[14] = 2048;
    *(double *)&v27[16] = a5;
    __int16 v28 = 2114;
    id v29 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "loading image:%d for basename:%{public}@ scale:%g idiom:%{public}@", buf, 0x26u);
  }

  if (a5 <= 1.0)
  {
    v16 = +[NSString stringWithFormat:@"%@%d%@%@", v11, a3, &stru_1000FD108, v12];
  }
  else
  {
    v15 = +[NSString stringWithFormat:@"@%dx", (int)a5];
    v16 = +[NSString stringWithFormat:@"%@%d%@%@", v11, a3, v15, v12];
  }
  CFURLRef v17 = [v13 URLForResource:v16 withExtension:@".png"];
  CFURLRef v18 = v17;
  if (v17 && (CGImageSourceRef v19 = CGImageSourceCreateWithURL(v17, 0)) != 0)
  {
    int v20 = v19;
    __int16 v21 = sub_10005F9DC();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)v27 = v16;
      _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Loaded: %{public}@", buf, 0xCu);
    }

    ImageAtIndex = CGImageSourceCreateImageAtIndex(v20, 0, 0);
    CFRelease(v20);
  }
  else
  {
    v23 = sub_10005F9DC();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v25 = [v13 bundlePath];
      *(_DWORD *)buf = 138543618;
      *(void *)v27 = v16;
      *(_WORD *)&v27[8] = 2114;
      *(void *)&v27[10] = v25;
      _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Can't find requested image: %{public}@ in %{public}@", buf, 0x16u);
    }
    ImageAtIndex = 0;
  }

  return ImageAtIndex;
}

- (id)allImages
{
  [(BKImageSequence *)self _loadAllImages];
  images = self->_images;

  return [(NSPointerArray *)images allObjects];
}

- (BKImageSequence)initWithBasename:(id)a3 bundle:(id)a4 imageCount:(int64_t)a5 scale:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  v21.receiver = self;
  v21.super_class = (Class)BKImageSequence;
  id v12 = [(BKImageSequence *)&v21 init];
  id v13 = v12;
  if (v12)
  {
    v12->_maximumImageCount = a5;
    v12->_double scale = a6;
    v14 = (NSString *)[v10 copy];
    basename = v13->_basename;
    v13->_basename = v14;

    objc_storeStrong((id *)&v13->_bundle, a4);
    uint64_t v16 = +[NSPointerArray pointerArrayWithOptions:0];
    images = v13->_images;
    v13->_images = (NSPointerArray *)v16;

    [(NSPointerArray *)v13->_images setCount:a5];
    uint64_t v18 = [(BKImageSequence *)v13 _idiomSuffix];
    idiomSuffix = v13->_idiomSuffix;
    v13->_idiomSuffix = (NSString *)v18;
  }
  return v13;
}

@end