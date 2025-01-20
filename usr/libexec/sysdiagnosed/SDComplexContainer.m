@interface SDComplexContainer
+ (id)complexContainerWithBlock:(id)a3 withTimeout:(double)a4 atDestination:(id)a5 withDelegate:(id)a6;
+ (id)complexContainerWithSPITask:(int)a3 withTimeout:(double)a4 atDestination:(id)a5 withDelegate:(id)a6;
+ (id)complexContainerWithSPITask:(int)a3 withTimeout:(double)a4 atDestination:(id)a5 withDelegate:(id)a6 withIntermediateDirectory:(id)a7;
+ (id)complexContainerWithTasks:(id)a3 withTimeout:(double)a4 withRules:(id)a5 atDestination:(id)a6 withDelegate:(id)a7;
+ (id)complexContainerWithTasks:(id)a3 withTimeout:(double)a4 withRules:(id)a5 atDestination:(id)a6 withDelegate:(id)a7 isConcurrent:(BOOL)a8;
- (BOOL)_executeFromCallback:(BOOL)a3;
- (BOOL)execute;
- (BOOL)executeFromCallback;
- (SDLogCollectionContainer)collectionContainer;
- (SDTaskContainer)taskContainer;
- (id)name;
- (void)applyContainerOverride:(id)a3;
- (void)setCollectionContainer:(id)a3;
- (void)setName:(id)a3;
- (void)setTaskContainer:(id)a3;
@end

@implementation SDComplexContainer

+ (id)complexContainerWithTasks:(id)a3 withTimeout:(double)a4 withRules:(id)a5 atDestination:(id)a6 withDelegate:(id)a7
{
  return +[SDComplexContainer complexContainerWithTasks:a3 withTimeout:a5 withRules:a6 atDestination:a7 withDelegate:0 isConcurrent:a4];
}

+ (id)complexContainerWithTasks:(id)a3 withTimeout:(double)a4 withRules:(id)a5 atDestination:(id)a6 withDelegate:(id)a7 isConcurrent:(BOOL)a8
{
  BOOL v8 = a8;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = sub_100028D20(v15, @"unnamed_tasks");
  v18 = sub_10002B338(v16, v17);
  if (v18)
  {
    v20 = [(SDContainer *)[SDComplexContainer alloc] initWithName:v17 andDestination:v15 withDelegate:v16];
    if (v20)
    {
      id v42 = v13;
      v43 = v14;
      v21 = sub_100028DBC(v17, v19);
      v22 = +[SDLogCollectionContainer containerWithName:v21 destination:v15 withDelegate:v16];

      if (v22)
      {
        [(SDComplexContainer *)v20 setCollectionContainer:v22];
        v24 = [(SDComplexContainer *)v20 collectionContainer];
        [v24 setResolveHomeDirs:0];

        v25 = [(SDComplexContainer *)v20 collectionContainer];
        +[SDUnitLogDirectory logRuleWithDirectory:v18];
        v27 = BOOL v26 = v8;
        v28 = [v43 arrayByAddingObject:v27];
        [v25 addRules:v28];

        BOOL v8 = v26;
      }
      v29 = sub_100028DB0(v17, v23);
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_10002B628;
      v44[3] = &unk_10009CFE0;
      id v45 = v22;
      id v30 = v22;
      v31 = +[SDTaskDepotContainer containerWithName:v29 destination:v15 withTimeout:v8 withConcurrency:v16 withDelegate:v44 withCompletionBlock:a4];

      id v13 = v42;
      if (v31)
      {
        [v31 addSDTasksToContainer:v42 withTmpOutputDir:v18];
        [(SDComplexContainer *)v20 setTaskContainer:v31];
      }
      v20 = v20;

      v32 = v20;
      id v14 = v43;
    }
    else
    {
      v32 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100062F90((uint64_t)v17, v33, v34, v35, v36, v37, v38, v39);
    }
    v40 = +[SDResourceManager sharedResourceManager];
    [v40 stderrWrite:@"Tasks container %@ has invalid temporary directory", v17];

    v20 = +[SDResourceManager sharedResourceManager];
    [(SDComplexContainer *)v20 log:@"Tasks container %@ has invalid temporary directory", v17];
    v32 = 0;
  }

  return v32;
}

+ (id)complexContainerWithSPITask:(int)a3 withTimeout:(double)a4 atDestination:(id)a5 withDelegate:(id)a6 withIntermediateDirectory:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  if (v13)
  {
    id v14 = sub_100047A04(v10);
    id v15 = sub_100028D20(v11, v14);

    v17 = [(SDContainer *)[SDComplexContainer alloc] initWithName:v15 andDestination:v11 withDelegate:v12];
    if (v17)
    {
      v18 = sub_100028DBC(v15, v16);
      v19 = +[SDLogCollectionContainer containerWithName:v18 destination:v11 withDelegate:v12];

      if (v19)
      {
        [(SDComplexContainer *)v17 setCollectionContainer:v19];
        v20 = [(SDComplexContainer *)v17 collectionContainer];
        [v20 setResolveHomeDirs:0];

        [v19 setFlattenReturnedDirectoryPaths:1];
        v21 = [(SDComplexContainer *)v17 collectionContainer];
        v22 = +[SDUnitLogDirectory logRuleWithDirectory:v13];
        uint64_t v38 = v22;
        v23 = +[NSArray arrayWithObjects:&v38 count:1];
        [v21 addRules:v23];
      }
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_10002B934;
      v36[3] = &unk_10009D9E8;
      id v37 = v19;
      id v24 = v19;
      v25 = +[SDLogAgentContainer containerAtLocation:v13 forTaskType:v10 withTimeout:v12 withDelegate:0 withMsgContents:v36 withReplyBlock:a4];
      if (v25) {
        [(SDComplexContainer *)v17 setTaskContainer:v25];
      }
      BOOL v26 = v17;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100063124((uint64_t)v11, v27, v28, v29, v30, v31, v32, v33);
    }
    uint64_t v34 = +[SDResourceManager sharedResourceManager];
    [v34 stderrWrite:@"Task %@ has invalid temporary directory", v11];

    id v15 = +[SDResourceManager sharedResourceManager];
    [v15 log:@"Task %@ has invalid temporary directory", v11];
    v17 = 0;
  }

  return v17;
}

+ (id)complexContainerWithSPITask:(int)a3 withTimeout:(double)a4 atDestination:(id)a5 withDelegate:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v9 = a6;
  id v10 = a5;
  id v11 = sub_100047A04(v8);
  id v12 = sub_100028D20(v10, v11);

  id v13 = sub_10002B338(v9, v12);
  id v14 = +[SDComplexContainer complexContainerWithSPITask:v8 withTimeout:v10 atDestination:v9 withDelegate:v13 withIntermediateDirectory:a4];

  return v14;
}

+ (id)complexContainerWithBlock:(id)a3 withTimeout:(double)a4 atDestination:(id)a5 withDelegate:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = sub_100028D20(v10, @"unnamed_block");
  id v14 = [(SDContainer *)[SDComplexContainer alloc] initWithName:v12 andDestination:v10 withDelegate:v11];
  if (v14)
  {
    id v15 = sub_100028DBC(v12, v13);
    id v16 = +[SDLogCollectionContainer containerWithName:v15 destination:v10 withDelegate:v11];

    if (v16)
    {
      [(SDComplexContainer *)v14 setCollectionContainer:v16];
      v18 = [(SDComplexContainer *)v14 collectionContainer];
      [v18 setResolveHomeDirs:0];
    }
    v19 = sub_100028DB0(v12, v17);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10002BC40;
    v24[3] = &unk_10009DA10;
    id v25 = v16;
    id v20 = v16;
    v21 = +[SDBlockContainer containerWithName:v19 forBlock:v9 withTimeout:v11 withDelegate:v24 withCompletionBlock:a4];

    if (v21) {
      [(SDComplexContainer *)v14 setTaskContainer:v21];
    }
    v22 = v14;
  }

  return v14;
}

- (void)setName:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_name, a3);
  if (self->_taskContainer)
  {
    v6 = sub_100028DB0(v8, v5);
    [(SDContainer *)self->_taskContainer setName:v6];
  }
  if (self->_collectionContainer)
  {
    v7 = sub_100028DBC(v8, v5);
    [(SDContainer *)self->_collectionContainer setName:v7];
  }
}

- (BOOL)_executeFromCallback:(BOOL)a3
{
  BOOL v3 = a3;
  [(SDContainer *)self updateContainerWithOverride];
  v5 = [(SDComplexContainer *)self collectionContainer];

  if (v5)
  {
    unint64_t v6 = [(SDContainer *)self runtimeChecks];
    v7 = [(SDComplexContainer *)self collectionContainer];
    [v7 setRuntimeChecks:v6];
  }
  id v8 = [(SDComplexContainer *)self taskContainer];

  if (v8)
  {
    unint64_t v9 = [(SDContainer *)self runtimeChecks];
    id v10 = [(SDComplexContainer *)self taskContainer];
    [v10 setRuntimeChecks:v9];

    id v11 = [(SDComplexContainer *)self taskContainer];
    id v12 = v11;
    if (v3) {
      [v11 executeFromCallback];
    }
    else {
      [v11 execute];
    }
  }
  return 1;
}

- (BOOL)executeFromCallback
{
  return [(SDComplexContainer *)self _executeFromCallback:1];
}

- (BOOL)execute
{
  return [(SDComplexContainer *)self _executeFromCallback:0];
}

- (void)applyContainerOverride:(id)a3
{
  id v13 = a3;
  v4 = [v13 objectForKeyedSubscript:@"timeout"];
  if (v4)
  {
    v5 = [(SDComplexContainer *)self taskContainer];

    if (v5)
    {
      [v4 doubleValue];
      double v7 = v6;
      id v8 = [(SDComplexContainer *)self taskContainer];
      [v8 setTimeout:v7];
    }
  }
  unint64_t v9 = [v13 objectForKeyedSubscript:@"maxSizeMB"];
  if (v9)
  {
    id v10 = [(SDComplexContainer *)self collectionContainer];

    if (v10)
    {
      id v11 = [v9 unsignedIntegerValue];
      id v12 = [(SDComplexContainer *)self collectionContainer];
      [v12 setMaximumSizeMB:v11];
    }
  }
}

- (id)name
{
  return self->_name;
}

- (SDTaskContainer)taskContainer
{
  return self->_taskContainer;
}

- (void)setTaskContainer:(id)a3
{
}

- (SDLogCollectionContainer)collectionContainer
{
  return self->_collectionContainer;
}

- (void)setCollectionContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionContainer, 0);
  objc_storeStrong((id *)&self->_taskContainer, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end