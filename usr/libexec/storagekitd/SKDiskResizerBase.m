@interface SKDiskResizerBase
- (BOOL)resizeWithError:(id *)a3;
- (NSError)resizeError;
- (SKDisk)disk;
- (SKDiskResizerBase)initWithDisk:(id)a3 requestedSize:(unint64_t)a4;
- (SKProgress)progress;
- (SKStateMachine)activeFSM;
- (id)cancelWithError:(id *)a3;
- (id)eventFromSize;
- (id)resizeStateMachine:(id *)a3;
- (id)rollbackResize:(id *)a3;
- (int64_t)completedUnitCount;
- (unint64_t)currentSize;
- (unint64_t)originalSize;
- (unint64_t)requestedSize;
- (void)setActiveFSM:(id)a3;
- (void)setCompletedUnitCount:(int64_t)a3;
- (void)setDisk:(id)a3;
- (void)setOriginalSize:(unint64_t)a3;
- (void)setProgress:(id)a3;
- (void)setRequestedSize:(unint64_t)a3;
- (void)setResizeError:(id)a3;
@end

@implementation SKDiskResizerBase

- (SKDiskResizerBase)initWithDisk:(id)a3 requestedSize:(unint64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SKDiskResizerBase;
  v8 = [(SKDiskResizerBase *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_disk, a3);
    v9->_requestedSize = a4;
    v9->_originalSize = [(SKDiskResizerBase *)v9 currentSize];
    uint64_t v10 = +[SKProgress progressWithTotalUnitCount:100];
    progress = v9->_progress;
    v9->_progress = (SKProgress *)v10;
  }
  return v9;
}

- (int64_t)completedUnitCount
{
  v2 = [(SKDiskResizerBase *)self progress];
  id v3 = [v2 completedUnitCount];

  return (int64_t)v3;
}

- (void)setCompletedUnitCount:(int64_t)a3
{
  v5 = [(SKDiskResizerBase *)self resizeError];

  if (!v5)
  {
    if (a3 >= 100) {
      a3 = 100;
    }
    id v6 = [(SKDiskResizerBase *)self progress];
    [v6 setCompletedUnitCount:a3];
  }
}

- (unint64_t)currentSize
{
  v2 = [(SKDiskResizerBase *)self disk];
  id v3 = [v2 unformattedSize];

  return (unint64_t)v3;
}

- (BOOL)resizeWithError:(id *)a3
{
  v5 = -[SKDiskResizerBase resizeStateMachine:](self, "resizeStateMachine:");
  [(SKDiskResizerBase *)self setActiveFSM:v5];

  id v6 = [(SKDiskResizerBase *)self activeFSM];

  if (v6)
  {
    id v7 = [(SKDiskResizerBase *)self activeFSM];
    id v16 = 0;
    [v7 runWithError:&v16];
    v8 = v16;

    v9 = [(SKDiskResizerBase *)self resizeError];

    if (v9)
    {
      uint64_t v10 = [(SKDiskResizerBase *)self resizeError];

      v8 = v10;
    }
    if (a3) {
      *a3 = v8;
    }
    [(SKDiskResizerBase *)self setActiveFSM:0];
    v11 = [(SKDiskResizerBase *)self progress];
    id v12 = [v11 totalUnitCount];
    objc_super v13 = [(SKDiskResizerBase *)self progress];
    [v13 setCompletedUnitCount:v12];

    BOOL v14 = v8 == 0;
  }
  else
  {
    v8 = sub_10000DD48();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[SKDiskResizerBase resizeWithError:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s: Can't create FSM for resize", buf, 0xCu);
    }
    BOOL v14 = 0;
  }

  return v14;
}

- (id)resizeStateMachine:(id *)a3
{
  id v3 = +[NSException exceptionWithName:@"com.apple.storagekit.notimplemented" reason:@"A required method is not implemented" userInfo:0];
  [v3 raise];

  return 0;
}

- (id)eventFromSize
{
  unint64_t v3 = [(SKDiskResizerBase *)self requestedSize];
  unint64_t v4 = [(SKDiskResizerBase *)self originalSize];
  v5 = &off_100055820;
  if (v3 <= v4) {
    v5 = &off_100055828;
  }
  id v6 = *v5;

  return v6;
}

- (id)cancelWithError:(id *)a3
{
  id v5 = +[SKError errorWithPOSIXCode:89 error:a3];

  return [(SKDiskResizerBase *)self rollbackResize:a3];
}

- (id)rollbackResize:(id *)a3
{
  if (a3 && (id v5 = *a3) != 0)
  {
    id v6 = v5;
    id v7 = [(SKDiskResizerBase *)self resizeError];

    v8 = sub_10000DD48();
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = [(SKDiskResizerBase *)self resizeError];
        int v15 = 136315650;
        id v16 = "-[SKDiskResizerBase rollbackResize:]";
        __int16 v17 = 2112;
        v18 = v6;
        __int16 v19 = 2112;
        unint64_t v20 = (unint64_t)v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s: Failing resize with %@ after attempt to recover from %@", (uint8_t *)&v15, 0x20u);
      }
      *a3 = [(SKDiskResizerBase *)self resizeError];

      v11 = 0;
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315906;
        id v16 = "-[SKDiskResizerBase rollbackResize:]";
        __int16 v17 = 2112;
        v18 = v6;
        __int16 v19 = 2048;
        unint64_t v20 = [(SKDiskResizerBase *)self requestedSize];
        __int16 v21 = 2048;
        unint64_t v22 = [(SKDiskResizerBase *)self originalSize];
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Rolling back resize after %@, reverting resize direction from %llu to %llu", (uint8_t *)&v15, 0x2Au);
      }

      [(SKDiskResizerBase *)self setResizeError:v6];
      unint64_t v14 = [(SKDiskResizerBase *)self requestedSize];
      [(SKDiskResizerBase *)self setRequestedSize:[(SKDiskResizerBase *)self originalSize]];
      [(SKDiskResizerBase *)self setOriginalSize:v14];
      v11 = [(SKDiskResizerBase *)self eventFromSize];
    }
  }
  else
  {
    id v12 = sub_10000DD48();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315138;
      id v16 = "-[SKDiskResizerBase rollbackResize:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s: Reached resize rollback without setting any error", (uint8_t *)&v15, 0xCu);
    }

    v11 = +[SKError nilWithSKErrorCode:102 error:a3];
  }

  return v11;
}

- (SKDisk)disk
{
  return self->_disk;
}

- (void)setDisk:(id)a3
{
}

- (unint64_t)requestedSize
{
  return self->_requestedSize;
}

- (void)setRequestedSize:(unint64_t)a3
{
  self->_requestedSize = a3;
}

- (SKProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (SKStateMachine)activeFSM
{
  return self->_activeFSM;
}

- (void)setActiveFSM:(id)a3
{
}

- (NSError)resizeError
{
  return self->_resizeError;
}

- (void)setResizeError:(id)a3
{
}

- (unint64_t)originalSize
{
  return self->_originalSize;
}

- (void)setOriginalSize:(unint64_t)a3
{
  self->_originalSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resizeError, 0);
  objc_storeStrong((id *)&self->_activeFSM, 0);
  objc_storeStrong((id *)&self->_progress, 0);

  objc_storeStrong((id *)&self->_disk, 0);
}

@end