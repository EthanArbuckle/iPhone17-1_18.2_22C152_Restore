@interface SKFilesystemCreator
- (BOOL)createWithVolumes:(id)a3 error:(id *)a4;
- (BOOL)setupTaskUpdateHandlerWithClient:(id)a3 taskPairs:(id)a4 error:(id *)a5;
- (SKFilesystemCreator)init;
- (SKProgress)progress;
- (void)setProgress:(id)a3;
@end

@implementation SKFilesystemCreator

- (SKFilesystemCreator)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKFilesystemCreator;
  v2 = [(SKFilesystemCreator *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[SKProgress progressWithTotalUnitCount:100];
    progress = v2->_progress;
    v2->_progress = (SKProgress *)v3;
  }
  return v2;
}

- (BOOL)setupTaskUpdateHandlerWithClient:(id)a3 taskPairs:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = sub_1000269F0;
    v23 = sub_100026A00;
    id v24 = 0;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10002997C;
    v17[3] = &unk_100049858;
    id v18 = v8;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100029D7C;
    v14[3] = &unk_100049880;
    v16 = &v19;
    v10 = v9;
    v15 = v10;
    [v7 setTaskUpdateHandler:v17 replyHandler:v14];
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    v11 = (void *)v20[5];
    BOOL v12 = v11 == 0;
    if (a5 && v11) {
      *a5 = v11;
    }

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (BOOL)createWithVolumes:(id)a3 error:(id *)a4
{
  v67 = (SKWaitableAggregate *)a3;
  v69 = objc_opt_new();
  v70 = objc_opt_new();
  v4 = sub_10000DD48();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v93 = "-[SKFilesystemCreator createWithVolumes:error:]";
    __int16 v94 = 2112;
    v95 = v67;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Creating volumes %@", buf, 0x16u);
  }

  v5 = objc_opt_new();
  group = dispatch_group_create();
  if ([(SKFilesystemCreator *)self setupTaskUpdateHandlerWithClient:v5 taskPairs:v70 error:a4])
  {
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    obj = v67;
    id v74 = [(SKWaitableAggregate *)obj countByEnumeratingWithState:&v88 objects:v99 count:16];
    if (v74)
    {
      uint64_t v73 = *(void *)v89;
      while (2)
      {
        for (i = 0; i != v74; i = (char *)i + 1)
        {
          if (*(void *)v89 != v73) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v88 + 1) + 8 * i);
          id v8 = [v7 filesystem];
          unsigned int v9 = [v8 isExtension];

          if (v9)
          {
            if (!v5)
            {
              p_super = sub_10000DD48();
              if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315138;
                v93 = "-[SKFilesystemCreator createWithVolumes:error:]";
                _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_ERROR, "%s: Cannot create FSClient object for extension erase", buf, 0xCu);
              }
              LOBYTE(v61) = 0;
              goto LABEL_34;
            }
            v10 = [v7 disk];
            v11 = [v10 diskIdentifier];
            v78 = +[FSBlockDeviceResource proxyResourceForBSDName:v11 writable:1];

            BOOL v12 = [SKFSTaskPair alloc];
            v13 = [SKFSTaskMessageHandler alloc];
            v14 = [(SKFilesystemCreator *)self progress];
            v15 = [(SKFSTaskMessageHandler *)v13 initWithProgress:v14 dispatchGroup:group];
            v16 = [(SKFSTaskPair *)v12 initWithMessageHandler:v15];

            id v17 = v70;
            objc_sync_enter(v17);
            [v17 addObject:v16];
            objc_sync_exit(v17);

            id v18 = [v7 filesystem];
            uint64_t v19 = [v18 bundle];
            v20 = [v19 bundleIdentifier];
            uint64_t v21 = sub_100027820(v20, 1, a4);

            if (!v21)
            {
              sub_10000DD48();
              v61 = (SKRemoteTaskExecuter *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(&v61->super, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315138;
                v93 = "-[SKFilesystemCreator createWithVolumes:error:]";
                _os_log_impl((void *)&_mh_execute_header, &v61->super, OS_LOG_TYPE_ERROR, "%s: Failed to create bundle options", buf, 0xCu);
              }

              LOBYTE(v61) = 0;
              p_super = &v78->super;
              goto LABEL_34;
            }
            v22 = [v7 name];
            v23 = +[FSTaskOption option:@"v" value:v22];
            [v21 addOption:v23];

            id v24 = [v7 filesystem];
            v25 = [v24 majorType];
            LODWORD(v23) = [v25 isEqualToString:@"apfs"];

            if (v23)
            {
              v26 = [v7 filesystem];
              v27 = [v26 isCaseSensitive] ? @"e" : @"i";
              v28 = +[FSTaskOption optionWithoutValue:v27];
              [v21 addOption:v28];

              v29 = +[FSTaskOption optionWithoutValue:@"w"];
              [v21 addOption:v29];

              v30 = [v7 filesystem];
              LODWORD(v28) = [v30 isEncrypted];

              if (v28)
              {
                v31 = +[FSTaskOption optionWithoutValue:@"E"];
                [v21 addOption:v31];

                v32 = [v7 password];
                v33 = +[FSTaskOption option:@"S" value:v32];
                [v21 addOption:v33];
              }
            }
            dispatch_group_enter(group);
            v34 = [v7 filesystem];
            v35 = [v34 bundle];
            v36 = [v35 bundleIdentifier];
            v37 = [(SKFSTaskPair *)v16 receiver];
            v38 = [v37 getConnection];
            v82[0] = _NSConcreteStackBlock;
            v82[1] = 3221225472;
            v82[2] = sub_10002A8D8;
            v82[3] = &unk_1000498E8;
            v83 = v16;
            v72 = v35;
            v39 = v34;
            v40 = v21;
            v41 = i;
            v42 = v5;
            id v43 = v5;
            id v84 = v43;
            v85 = self;
            v86 = obj;
            v87 = v7;
            v71 = v16;
            v44 = v43;
            v5 = v42;
            i = v41;
            [v44 formatResource:v78 usingBundle:v36 options:v40 connection:v38 replyHandler:v82];
          }
          else
          {
            v45 = [SKRemoteAPFSFormatTask alloc];
            v46 = [v7 name];
            v47 = [v7 disk];
            v48 = [v7 filesystem];
            id v49 = [v48 isCaseSensitive];
            v50 = [v7 password];
            v78 = [(SKRemoteAPFSFormatTask *)v45 initWithName:v46 disk:v47 caseSensitive:v49 password:v50];

            v51 = [(SKFilesystemCreator *)self progress];
            v52 = [(SKRemoteAPFSFormatTask *)v78 progress];
            [v51 addChild:v52 withPendingUnitCount:0x64 / [obj count]];

            v53 = [SKTaskLineParser alloc];
            v81[0] = _NSConcreteStackBlock;
            v81[1] = 3221225472;
            v81[2] = sub_10002AC70;
            v81[3] = &unk_100049910;
            v81[4] = self;
            v54 = [(SKTaskLineParser *)v53 initWithCallback:v81];
            [(SKRemoteAPFSFormatTask *)v78 setStdoutParser:v54];

            v55 = [SKTaskLineParser alloc];
            v80[0] = _NSConcreteStackBlock;
            v80[1] = 3221225472;
            v80[2] = sub_10002ACD8;
            v80[3] = &unk_100049910;
            v80[4] = self;
            v56 = [(SKTaskLineParser *)v55 initWithCallback:v80];
            [(SKRemoteAPFSFormatTask *)v78 setStderrParser:v56];

            [v69 addObject:v78];
          }
        }
        id v74 = [(SKWaitableAggregate *)obj countByEnumeratingWithState:&v88 objects:v99 count:16];
        if (v74) {
          continue;
        }
        break;
      }
    }

    v57 = [SKWaitableAggregate alloc];
    v61 = [[SKRemoteTaskExecuter alloc] initWithTasks:v69];
    v98[0] = v61;
    v58 = [[SKFSTaskPairsWaiter alloc] initWithTaskPairs:v70];
    v98[1] = v58;
    v59 = +[NSArray arrayWithObjects:v98 count:2];
    v60 = [(SKWaitableAggregate *)v57 initWithWaitables:v59];

    id v79 = 0;
    LODWORD(v61) = [(SKWaitableAggregate *)v60 waitWithError:&v79];
    v62 = v79;
    v63 = sub_10000DD48();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v93 = "-[SKFilesystemCreator createWithVolumes:error:]";
      __int16 v94 = 2112;
      v95 = obj;
      __int16 v96 = 1024;
      int v97 = (int)v61;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "%s: Finished creating volumes %@, status %hhd", buf, 0x1Cu);
    }

    [v5 setTaskUpdateHandler:0 replyHandler:0];
    p_super = v62;
    if (v62)
    {
      v65 = +[SKError errorWithCode:352 underlyingError:v62];
      LOBYTE(v61) = +[SKError failWithError:v65 error:a4];

      obj = v60;
      p_super = v62;
    }
    else
    {
      obj = v60;
    }
LABEL_34:
  }
  else
  {
    LOBYTE(v61) = 0;
  }

  return (char)v61;
}

- (SKProgress)progress
{
  return (SKProgress *)objc_getProperty(self, a2, 8, 1);
}

- (void)setProgress:(id)a3
{
}

- (void).cxx_destruct
{
}

@end