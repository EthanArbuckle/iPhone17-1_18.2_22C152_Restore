@interface SKEraseDisk
- (id)createStateMachineWithError:(id *)a3;
@end

@implementation SKEraseDisk

- (id)createStateMachineWithError:(id *)a3
{
  v5 = [(SKEraseDisk *)self disk];

  if (v5) {
    goto LABEL_3;
  }
  v6 = +[SKDaemonManager sharedManager];
  v7 = [(SKEraseDisk *)self diskRepresentation];
  v8 = [v6 knownDiskForDictionary:v7];
  [(SKEraseDisk *)self setDisk:v8];

  v9 = [(SKEraseDisk *)self disk];

  if (v9)
  {
LABEL_3:
    v10 = [(SKEraseDisk *)self validateWithError:a3];

    if (v10)
    {
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      v11 = [(SKEraseDisk *)self descriptors];
      id v12 = [v11 countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v44;
        while (2)
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v44 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            v17 = [v16 filesystem];
            v18 = [v16 name];
            unsigned int v19 = [v17 isValidName:v18 error:a3];

            if (!v19)
            {

              goto LABEL_14;
            }
          }
          id v13 = [v11 countByEnumeratingWithState:&v43 objects:v48 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_10000A968;
      v41[3] = &unk_100048C78;
      v41[4] = self;
      v42 = @"done";
      v34 = objc_retainBlock(v41);
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_10000AC64;
      v39[3] = &unk_100048C78;
      v39[4] = self;
      v40 = @"done";
      v33 = objc_retainBlock(v39);
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10000B034;
      v37[3] = &unk_100048C78;
      v37[4] = self;
      v38 = @"done";
      v32 = objc_retainBlock(v37);
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_10000B264;
      v35[3] = &unk_100048C78;
      v35[4] = self;
      v36 = @"done";
      v20 = objc_retainBlock(v35);
      v21 = sub_10000C2F8(@"begin", @"begin", (uint64_t)v34, @"repartitioned");
      v47[0] = v21;
      v22 = sub_10000C2F8(@"repartitioned", @"done", (uint64_t)v33, @"newfsed");
      v47[1] = v22;
      v23 = sub_10000C2F8(@"newfsed", @"done", (uint64_t)v32, @"reprobed");
      v47[2] = v23;
      v24 = sub_10000C2F8(@"reprobed", @"done", (uint64_t)v20, @"unmountedState");
      v47[3] = v24;
      v25 = sub_10000C348(@"unmountedState", @"done");
      v47[4] = v25;
      v26 = +[NSArray arrayWithObjects:v47 count:5];
      v27 = +[SKStateTransitionTable tableWithTransitionEntries:v26];
      v28 = +[SKStateMachine machineWithStateTransitionTable:v27 startState:@"begin" startEvent:@"begin"];
    }
    else
    {
LABEL_14:
      v28 = 0;
    }
  }
  else
  {
    v30 = [(SKEraseDisk *)self diskRepresentation];
    v31 = +[SKError errorWithCode:117 userInfo:v30];
    v28 = +[SKError nilWithError:v31 error:a3];
  }

  return v28;
}

@end