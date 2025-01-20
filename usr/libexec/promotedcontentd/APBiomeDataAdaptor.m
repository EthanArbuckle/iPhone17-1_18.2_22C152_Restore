@interface APBiomeDataAdaptor
- (BMStream)stream;
- (BOOL)_validateParameters:(id *)a3;
- (BOOL)addData:(id)a3;
- (BOOL)allowEmptyParameters;
- (id)_biomeStream;
- (id)handler;
- (void)_run:(id)a3;
- (void)clearAllData;
- (void)clearDataWithPredicate:(id)a3;
- (void)setHandler:(id)a3;
- (void)setStream:(id)a3;
@end

@implementation APBiomeDataAdaptor

- (BOOL)_validateParameters:(id *)a3
{
  v27.receiver = self;
  v27.super_class = (Class)APBiomeDataAdaptor;
  if (-[APDataAdaptor _validateParameters:](&v27, "_validateParameters:"))
  {
    v5 = [(APDataAdaptor *)self parameters];
    v6 = [v5 objectForKeyedSubscript:@"startDate"];
    if (v6)
    {
      v7 = [(APDataAdaptor *)self parameters];
      v8 = [v7 objectForKeyedSubscript:@"startDate"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int isKindOfClass = 1;
      }
      else
      {
        v11 = [(APDataAdaptor *)self parameters];
        v12 = [v11 objectForKeyedSubscript:@"startDate"];
        objc_opt_class();
        int isKindOfClass = objc_opt_isKindOfClass();
      }
    }
    else
    {
      int isKindOfClass = 1;
    }

    v13 = [(APDataAdaptor *)self parameters];
    v14 = [v13 objectForKeyedSubscript:@"endDate"];
    if (v14)
    {
      v15 = [(APDataAdaptor *)self parameters];
      v16 = [v15 objectForKeyedSubscript:@"endDate"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v17 = [(APDataAdaptor *)self parameters];
        v18 = [v17 objectForKeyedSubscript:@"endDate"];
        objc_opt_class();
        isKindOfClass &= objc_opt_isKindOfClass();
      }
    }

    uint64_t v19 = [(APDataAdaptor *)self parameters];
    v20 = [(id)v19 objectForKeyedSubscript:@"maxEvents"];
    unsigned int v21 = isKindOfClass & [(APDataAdaptor *)self _checkClassType:v20 name:@"maxEvents" expectedClass:objc_opt_class() error:a3];

    v22 = [(APDataAdaptor *)self parameters];
    v23 = [v22 objectForKeyedSubscript:@"lastN"];
    LODWORD(v19) = [(APDataAdaptor *)self _checkClassType:v23 name:@"lastN" expectedClass:objc_opt_class() error:a3];

    v24 = [(APDataAdaptor *)self parameters];
    v25 = [v24 objectForKeyedSubscript:@"reverse"];
    BOOL v10 = v21 & v19 & [(APDataAdaptor *)self _checkClassType:v25 name:@"reverse" expectedClass:objc_opt_class() error:a3];
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  return v10;
}

- (void)_run:(id)a3
{
  id v57 = a3;
  id v4 = objc_retainBlock(v57);
  id handler = self->_handler;
  self->_id handler = v4;

  v6 = [(APDataAdaptor *)self parameters];
  v7 = [v6 objectForKeyedSubscript:@"startDate"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v9 = [(APDataAdaptor *)self parameters];
  uint64_t v10 = [v9 objectForKeyedSubscript:@"startDate"];

  if (isKindOfClass) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  if (isKindOfClass) {
    v12 = 0;
  }
  else {
    v12 = (void *)v10;
  }
  v13 = [(APDataAdaptor *)self parameters];
  v14 = [v13 objectForKeyedSubscript:@"endDate"];
  objc_opt_class();
  char v15 = objc_opt_isKindOfClass();

  v16 = [(APDataAdaptor *)self parameters];
  uint64_t v17 = [v16 objectForKeyedSubscript:@"endDate"];
  if (v15) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = 0;
  }
  if (v15) {
    uint64_t v19 = 0;
  }
  else {
    uint64_t v19 = (void *)v17;
  }

  v20 = [(APDataAdaptor *)self parameters];
  unsigned int v21 = [v20 objectForKeyedSubscript:@"maxEvents"];
  objc_opt_class();
  char v22 = objc_opt_isKindOfClass();

  uint64_t v23 = 0;
  if (v22)
  {
    v24 = [(APDataAdaptor *)self parameters];
    v25 = [v24 objectForKeyedSubscript:@"maxEvents"];
    uint64_t v23 = [v25 unsignedIntValue];
  }
  v26 = [(APDataAdaptor *)self parameters];
  objc_super v27 = [v26 objectForKeyedSubscript:@"lastN"];
  objc_opt_class();
  char v28 = objc_opt_isKindOfClass();

  if (v28)
  {
    v29 = [(APDataAdaptor *)self parameters];
    v30 = [v29 objectForKeyedSubscript:@"lastN"];
    uint64_t v55 = [v30 unsignedIntValue];
  }
  else
  {
    uint64_t v55 = 0;
  }
  v31 = [(APDataAdaptor *)self parameters];
  v32 = [v31 objectForKeyedSubscript:@"reverse"];
  objc_opt_class();
  char v33 = objc_opt_isKindOfClass();

  if (v33)
  {
    v34 = [(APDataAdaptor *)self parameters];
    v35 = [v34 objectForKeyedSubscript:@"reverse"];
    id v36 = [v35 BOOLValue];
  }
  else
  {
    id v36 = 0;
  }
  if (!(v11 | v18))
  {
    id v37 = 0;
    goto LABEL_36;
  }
  id v37 = objc_alloc_init((Class)NSDateFormatter);
  [v37 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  if (v11)
  {
    uint64_t v38 = [v37 dateFromString:v11];

    if (v38)
    {
      v40 = 0;
      v12 = (void *)v38;
      if (!v18) {
        goto LABEL_32;
      }
    }
    else
    {
      v40 = sub_10005D0A8(v39, v11);
      v12 = 0;
      if (!v18) {
        goto LABEL_32;
      }
    }
  }
  else
  {
    v40 = 0;
    if (!v18)
    {
LABEL_32:
      if (v40) {
        goto LABEL_33;
      }
LABEL_36:
      v46 = [(APBiomeDataAdaptor *)self _biomeStream];
      [(APBiomeDataAdaptor *)self setStream:v46];

      v47 = [(APBiomeDataAdaptor *)self stream];

      if (v47)
      {
        id v48 = [objc_alloc((Class)BMPublisherOptions) initWithStartDate:v12 endDate:v19 maxEvents:v23 lastN:v56 reversed:v36];
        v49 = [(APBiomeDataAdaptor *)self stream];
        v50 = [v49 publisherWithOptions:v48];

        v60[0] = _NSConcreteStackBlock;
        v60[1] = 3221225472;
        v60[2] = sub_10005D19C;
        v60[3] = &unk_100233E68;
        v60[4] = self;
        v44 = v57;
        id v61 = v57;
        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472;
        v58[2] = sub_10005D318;
        v58[3] = &unk_100233EB0;
        id v59 = v61;
        id v51 = [v50 sinkWithCompletion:v60 receiveInput:v58];

        v40 = 0;
        goto LABEL_41;
      }
      NSErrorUserInfoKey v62 = NSLocalizedDescriptionKey;
      CFStringRef v63 = @"Biome stream must not be nil.";
      v52 = +[NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];
      v40 = +[NSError errorWithDomain:@"com.apple.ap.dataadaptors" code:5200 userInfo:v52];

      v53 = [(APBiomeDataAdaptor *)self handler];

      if (v53)
      {
        v54 = [(APBiomeDataAdaptor *)self handler];
        ((void (**)(void, void, void, void *))v54)[2](v54, 0, 0, v40);
      }
LABEL_40:
      v44 = v57;
      goto LABEL_41;
    }
  }
  uint64_t v41 = [v37 dateFromString:v18];

  if (v41)
  {
    uint64_t v19 = (void *)v41;
    goto LABEL_32;
  }
  uint64_t v45 = sub_10005D0A8(v42, v18);

  uint64_t v19 = 0;
  v40 = (void *)v45;
  if (!v45) {
    goto LABEL_36;
  }
LABEL_33:
  v43 = [(APBiomeDataAdaptor *)self handler];

  if (!v43) {
    goto LABEL_40;
  }
  v44 = v57;
  (*((void (**)(id, void, void, void *))v57 + 2))(v57, 0, 0, v40);
LABEL_41:
}

- (BOOL)addData:(id)a3
{
  id v4 = a3;
  v5 = [(APBiomeDataAdaptor *)self _biomeStream];
  [(APBiomeDataAdaptor *)self setStream:v5];

  v6 = [(APBiomeDataAdaptor *)self stream];

  if (!v6)
  {
    uint64_t v10 = APLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v22 = 138477827;
      uint64_t v23 = objc_opt_class();
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error creating stream %{private}@", (uint8_t *)&v22, 0xCu);
    }
    goto LABEL_15;
  }
  v7 = [(APBiomeDataAdaptor *)self stream];
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0)
  {
    v12 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v12);
    v13 = [(APBiomeDataAdaptor *)self stream];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      char v15 = [(APBiomeDataAdaptor *)self stream];
      uint64_t v16 = [v15 identifier];

      uint64_t v10 = v16;
    }
    uint64_t v17 = APLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      uint64_t v23 = (uint64_t)v10;
    }

    goto LABEL_15;
  }
  v9 = [(APBiomeDataAdaptor *)self stream];
  uint64_t v10 = [v9 source];

  if (!v10)
  {
    uint64_t v18 = APLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      int v22 = 138412290;
      uint64_t v23 = (uint64_t)v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Stream for %@ does not have a source", (uint8_t *)&v22, 0xCu);
    }
LABEL_15:
    BOOL v11 = 0;
    goto LABEL_16;
  }
  [v10 sendEvent:v4];
  BOOL v11 = 1;
LABEL_16:

  return v11;
}

- (BOOL)allowEmptyParameters
{
  return 1;
}

- (void)clearAllData
{
}

- (void)clearDataWithPredicate:(id)a3
{
  id v4 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005D930;
  block[3] = &unk_100233D50;
  block[4] = self;
  if (qword_1002888E8 != -1) {
    dispatch_once(&qword_1002888E8, block);
  }
  v5 = [(APBiomeDataAdaptor *)self stream];
  v6 = [v5 pruner];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    char v8 = [(APBiomeDataAdaptor *)self stream];
    v9 = [v8 pruner];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10005D9B0;
    v10[3] = &unk_100233F18;
    id v11 = v4;
    [v9 deleteEventsPassingTest:v10];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)APBiomeDataAdaptor;
    [(APDataAdaptor *)&v12 clearAllData];
  }
}

- (id)_biomeStream
{
  return 0;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (BMStream)stream
{
  return self->_stream;
}

- (void)setStream:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stream, 0);

  objc_storeStrong(&self->_handler, 0);
}

@end