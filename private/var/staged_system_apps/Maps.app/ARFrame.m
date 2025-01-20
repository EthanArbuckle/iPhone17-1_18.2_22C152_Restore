@interface ARFrame
- (float)indoorConfidence;
- (float)outdoorConfidence;
- (id)_observationWithIdentifier:(id)a3;
- (id)_observations;
@end

@implementation ARFrame

- (float)indoorConfidence
{
  v3 = [(ARFrame *)self _observationWithIdentifier:@"indoor"];
  v4 = v3;
  if (v3)
  {
    [v3 confidence];
    float v6 = v5;
    v7 = sub_100CD368C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 134349312;
      v14 = self;
      __int16 v15 = 2048;
      double v16 = v6;
      v8 = "[%{public}p] Got indoor confidence: %f";
      v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_DEBUG;
      uint32_t v11 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, (uint8_t *)&v13, v11);
    }
  }
  else
  {
    v7 = sub_100CD368C();
    float v6 = -1.0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v13 = 134349056;
      v14 = self;
      v8 = "[%{public}p] Could not find indoor observation";
      v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
      uint32_t v11 = 12;
      goto LABEL_6;
    }
  }

  return v6;
}

- (float)outdoorConfidence
{
  v3 = [(ARFrame *)self _observationWithIdentifier:@"outdoor"];
  v4 = v3;
  if (v3)
  {
    [v3 confidence];
    float v6 = v5;
    v7 = sub_100CD368C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 134349312;
      v14 = self;
      __int16 v15 = 2048;
      double v16 = v6;
      v8 = "[%{public}p] Got outdoor confidence: %f";
      v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_DEBUG;
      uint32_t v11 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, (uint8_t *)&v13, v11);
    }
  }
  else
  {
    v7 = sub_100CD368C();
    float v6 = -1.0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v13 = 134349056;
      v14 = self;
      v8 = "[%{public}p] Could not find outdoor observation";
      v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
      uint32_t v11 = 12;
      goto LABEL_6;
    }
  }

  return v6;
}

- (id)_observationWithIdentifier:(id)a3
{
  id v4 = a3;
  float v5 = [(ARFrame *)self _observations];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100CD38F0;
  v9[3] = &unk_101320F40;
  id v10 = v4;
  id v6 = v4;
  v7 = sub_1000990A8(v5, v9);

  return v7;
}

- (id)_observations
{
  v3 = objc_getAssociatedObject(self, off_1015F70C8);
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2050000000;
    float v5 = (void *)qword_101610EB8;
    uint64_t v24 = qword_101610EB8;
    if (!qword_101610EB8)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_100CD3D7C;
      v27 = &unk_1012E9390;
      v28 = &v21;
      sub_100CD3D7C((uint64_t)buf);
      float v5 = (void *)v22[3];
    }
    id v6 = v5;
    _Block_object_dispose(&v21, 8);
    id v7 = objc_alloc_init(v6);
    id v20 = 0;
    unsigned int v8 = [v7 setRevision:3737841665 error:&v20];
    id v9 = v20;
    if (v8)
    {
      uint64_t v21 = 0;
      v22 = &v21;
      uint64_t v23 = 0x2050000000;
      id v10 = (void *)qword_101610EC0;
      uint64_t v24 = qword_101610EC0;
      if (!qword_101610EC0)
      {
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = sub_100CD3F6C;
        v27 = &unk_1012E9390;
        v28 = &v21;
        sub_100CD3F6C((uint64_t)buf);
        id v10 = (void *)v22[3];
      }
      uint32_t v11 = v10;
      _Block_object_dispose(&v21, 8);
      v12 = [[v11 alloc] initWithCVPixelBuffer:-[ARFrame capturedImage](self, "capturedImage") orientation:1 options:&__NSDictionary0__struct];
      id v25 = v7;
      int v13 = +[NSArray arrayWithObjects:&v25 count:1];
      id v19 = v9;
      unsigned int v14 = [v12 performRequests:v13 error:&v19];
      id v15 = v19;

      if (v14)
      {
        double v16 = [v7 results];
        v17 = sub_100CD368C();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134349314;
          *(void *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v16;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "[%{public}p] Got observation results: %@", buf, 0x16u);
        }
      }
      else
      {
        v17 = sub_100CD368C();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134349314;
          *(void *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v15;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "[%{public}p] Error performing observation request: %@", buf, 0x16u);
        }
        double v16 = &__NSArray0__struct;
      }
    }
    else
    {
      v12 = sub_100CD368C();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349314;
        *(void *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "[%{public}p] Error setting private revision: %@", buf, 0x16u);
      }
      double v16 = &__NSArray0__struct;
      id v15 = v9;
    }

    objc_setAssociatedObject(self, off_1015F70C8, v16, (void *)0x303);
    id v4 = v16;
  }

  return v4;
}

@end