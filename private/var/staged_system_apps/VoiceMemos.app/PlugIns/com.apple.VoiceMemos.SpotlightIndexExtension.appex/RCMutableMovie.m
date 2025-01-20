@interface RCMutableMovie
+ (id)movieWithURL:(id)a3 error:(id *)a4;
- (BOOL)rc_writeMovieHeaderWithOptions:(unint64_t)a3 error:(id *)a4;
- (NSURL)linkURL;
- (void)dealloc;
- (void)setLinkURL:(id)a3;
@end

@implementation RCMutableMovie

+ (id)movieWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 pathExtension];
  unsigned int v8 = [v7 isEqualToString:RCAudioFileExtensionQTA];

  if (v8)
  {
    v9 = [v6 temporaryMovieLink:a4];

    if (v9)
    {
      v10 = [a1 movieWithURL:v9 options:0];
      [v10 setLinkURL:v9];
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = [a1 movieWithURL:v6 options:0];
    v9 = v6;
  }

  return v10;
}

- (void)dealloc
{
  linkURL = self->_linkURL;
  if (linkURL)
  {
    v4 = linkURL;
    v5 = +[NSFileManager defaultManager];
    [v5 removeItemAtURL:v4 error:0];
  }
  v6.receiver = self;
  v6.super_class = (Class)RCMutableMovie;
  [(RCMutableMovie *)&v6 dealloc];
}

- (BOOL)rc_writeMovieHeaderWithOptions:(unint64_t)a3 error:(id *)a4
{
  v7 = [(RCMutableMovie *)self URL];
  unsigned int v8 = [v7 isQuickTime];
  v9 = (id *)&AVFileTypeQuickTimeMovie;
  if (!v8) {
    v9 = (id *)&AVFileTypeAppleM4A;
  }
  id v10 = *v9;

  v11 = [(RCMutableMovie *)self URL];
  unsigned __int8 v12 = [(RCMutableMovie *)self writeMovieHeaderToURL:v11 fileType:v10 options:a3 error:a4];

  return v12;
}

- (NSURL)linkURL
{
  return self->_linkURL;
}

- (void)setLinkURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end