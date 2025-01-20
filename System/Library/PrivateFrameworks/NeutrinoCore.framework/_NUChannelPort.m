@interface _NUChannelPort
- (BOOL)bindTo:(id)a3 error:(id *)a4;
- (NSArray)outputPorts;
- (NSArray)subports;
- (NSString)address;
- (NSString)compactDescription;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)name;
- (NUChannel)channel;
- (NUPipelineNode)node;
- (_NUChannelPort)initWithChannel:(id)a3;
- (_NUChannelPort)inputPort;
- (_NUChannelPort)rootPort;
- (_NUChannelPort)superport;
- (_NUPipeline)pipeline;
- (id)evaluate:(id *)a3;
- (id)subportForKey:(id)a3;
- (void)_addOutputPort:(id)a3;
- (void)_removeOutputPort:(id)a3;
- (void)setInputPort:(id)a3;
- (void)setPipeline:(id)a3;
- (void)setSuperport:(id)a3;
@end

@implementation _NUChannelPort

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputPort, 0);
  objc_storeStrong((id *)&self->_node, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_subports, 0);

  objc_storeStrong((id *)&self->_outputPorts, 0);
}

- (void)setSuperport:(id)a3
{
  self->_superport = (_NUChannelPort *)a3;
}

- (_NUChannelPort)superport
{
  return self->_superport;
}

- (void)setPipeline:(id)a3
{
  self->_pipeline = (_NUPipeline *)a3;
}

- (_NUPipeline)pipeline
{
  return self->_pipeline;
}

- (_NUChannelPort)inputPort
{
  return self->_inputPort;
}

- (NUPipelineNode)node
{
  return self->_node;
}

- (NUChannel)channel
{
  return self->_channel;
}

- (id)evaluate:(id *)a3
{
  v5 = [(_NUChannelPort *)self node];
  v6 = [(_NUChannelPort *)self channel];
  v7 = [v6 format];
  v8 = [v5 evaluateDataWithFormat:v7 error:a3];

  return v8;
}

- (BOOL)bindTo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(_NUChannelPort *)self node];
  LOBYTE(a4) = [v7 bindTo:v6 error:a4];

  return (char)a4;
}

- (NSString)compactDescription
{
  v3 = NSString;
  v4 = [(_NUChannelPort *)self pipeline];
  v5 = [v4 alias];
  id v6 = [(_NUChannelPort *)self address];
  v7 = [v3 stringWithFormat:@"%@:%@", v5, v6];

  return (NSString *)v7;
}

- (NSString)address
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = self;
  v5 = [(_NUChannelPort *)v4 superport];

  if (v5)
  {
    do
    {
      id v6 = [(_NUChannelPort *)v4 superport];
      v7 = [v6 subports];
      uint64_t v8 = [v7 indexOfObjectIdenticalTo:v4];

      v9 = [NSNumber numberWithUnsignedInteger:v8];
      [v3 insertObject:v9 atIndex:0];

      v10 = [(_NUChannelPort *)v4 superport];

      v11 = [(_NUChannelPort *)v10 superport];

      v4 = v10;
    }
    while (v11);
  }
  else
  {
    v10 = v4;
  }
  v12 = [(_NUChannelPort *)v10 pipeline];
  v13 = [(_NUChannelPort *)v10 channel];
  v14 = [v12 outputPortForChannel:v13];

  v15 = [(_NUChannelPort *)v10 pipeline];
  v16 = v15;
  if (v14 == v10) {
    [v15 outputChannels];
  }
  else {
  v17 = [v15 inputChannels];
  }
  v18 = [(_NUChannelPort *)v10 channel];
  uint64_t v19 = [v17 indexOfObject:v18];

  if (v14 == v10)
  {

    v16 = [(_NUChannelPort *)v10 pipeline];
    v17 = [v16 inputChannels];
    uint64_t v20 = [v17 count];
  }
  else
  {
    uint64_t v20 = 0;
  }

  v21 = [NSNumber numberWithUnsignedInteger:v20 + v19];
  [v3 insertObject:v21 atIndex:0];

  v22 = [v3 componentsJoinedByString:@"."];

  return (NSString *)v22;
}

- (NSString)debugDescription
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(_NUChannelPort *)self pipeline];
  id v6 = [v5 name];
  v7 = [(_NUChannelPort *)self name];
  uint64_t v8 = [v3 stringWithFormat:@"<%@:%p pipeline:'%@' name:'%@' node:%@>", v4, self, v6, v7, self->_node];

  return (NSString *)v8;
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = [(_NUChannelPort *)self pipeline];
  v5 = [v4 name];
  id v6 = [(_NUChannelPort *)self name];
  v7 = [v3 stringWithFormat:@"%@:%@", v5, v6];

  return (NSString *)v7;
}

- (NSString)name
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = self;
  do
  {
    v5 = [(_NUChannelPort *)v4 channel];
    id v6 = [v5 name];
    [v3 insertObject:v6 atIndex:0];

    uint64_t v7 = [(_NUChannelPort *)v4 superport];

    uint64_t v4 = (_NUChannelPort *)v7;
  }
  while (v7);
  uint64_t v8 = [v3 componentsJoinedByString:@"."];

  return (NSString *)v8;
}

- (_NUChannelPort)rootPort
{
  v2 = self;
  id v3 = [(_NUChannelPort *)v2 superport];

  if (v3)
  {
    do
    {
      uint64_t v4 = [(_NUChannelPort *)v2 superport];

      v5 = [(_NUChannelPort *)v4 superport];

      v2 = v4;
    }
    while (v5);
  }
  else
  {
    uint64_t v4 = v2;
  }

  return v4;
}

- (NSArray)subports
{
  v2 = [(NSHashTable *)self->_subports allObjects];
  id v3 = [v2 sortedArrayUsingComparator:&__block_literal_global_5146];

  return (NSArray *)v3;
}

- (id)subportForKey:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v10 = NUAssertLogger_5149();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "key != nil");
      *(_DWORD *)buf = 138543362;
      v27 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v13 = NUAssertLogger_5149();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v18 = (void *)MEMORY[0x1E4F29060];
        id v19 = v17;
        uint64_t v20 = [v18 callStackSymbols];
        v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v27 = v17;
        __int16 v28 = 2114;
        v29 = v21;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v27 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUChannelPort subportForKey:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 91, @"Invalid parameter not satisfying: %s", v22, v23, v24, v25, (uint64_t)"key != nil");
  }
  id v5 = v4;
  PFFind();
  id v6 = (_NUChannelPort *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    uint64_t v7 = [(NUChannel *)self->_channel subchannelForKey:v5];
    if (v7) {
      id v6 = [[_NUChannelPort alloc] initWithChannel:v7];
    }
    else {
      id v6 = 0;
    }
    [(_NUChannelPort *)v6 setSuperport:self];
    uint64_t v8 = [(_NUChannelPort *)self pipeline];
    [(_NUChannelPort *)v6 setPipeline:v8];

    [(NSHashTable *)self->_subports addObject:v6];
  }

  return v6;
}

- (void)_removeOutputPort:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v5 = NUAssertLogger_5149();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "port != nil");
      *(_DWORD *)buf = 138543362;
      v39 = v6;
      _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v8 = NUAssertLogger_5149();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v9)
      {
        id v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        uint64_t v22 = [v20 callStackSymbols];
        uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v39 = v19;
        __int16 v40 = 2114;
        v41 = v23;
        _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v9)
    {
      v10 = [MEMORY[0x1E4F29060] callStackSymbols];
      v11 = [v10 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v39 = v11;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUChannelPort _removeOutputPort:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 85, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"port != nil");
  }
  id v37 = v4;
  if (![(NSHashTable *)self->_outputPorts containsObject:v4])
  {
    v12 = NUAssertLogger_5149();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = [NSString stringWithFormat:@"Not a connected port: %@", v37];
      *(_DWORD *)buf = 138543362;
      v39 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v15 = NUAssertLogger_5149();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (v14)
    {
      if (v16)
      {
        __int16 v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v29 = (void *)MEMORY[0x1E4F29060];
        id v30 = v28;
        v31 = [v29 callStackSymbols];
        v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v39 = v28;
        __int16 v40 = 2114;
        v41 = v32;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v39 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUChannelPort _removeOutputPort:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 86, @"Not a connected port: %@", v33, v34, v35, v36, (uint64_t)v37);
  }
  [(NSHashTable *)self->_outputPorts removeObject:v37];
}

- (void)_addOutputPort:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v5 = NUAssertLogger_5149();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "port != nil");
      *(_DWORD *)buf = 138543362;
      v39 = v6;
      _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v8 = NUAssertLogger_5149();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v9)
      {
        id v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        uint64_t v22 = [v20 callStackSymbols];
        uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v39 = v19;
        __int16 v40 = 2114;
        v41 = v23;
        _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v9)
    {
      v10 = [MEMORY[0x1E4F29060] callStackSymbols];
      v11 = [v10 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v39 = v11;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUChannelPort _addOutputPort:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 79, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"port != nil");
  }
  id v37 = v4;
  if ([(NSHashTable *)self->_outputPorts containsObject:v4])
  {
    v12 = NUAssertLogger_5149();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = [NSString stringWithFormat:@"Port is already connected: %@", v37];
      *(_DWORD *)buf = 138543362;
      v39 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v15 = NUAssertLogger_5149();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (v14)
    {
      if (v16)
      {
        __int16 v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v29 = (void *)MEMORY[0x1E4F29060];
        id v30 = v28;
        v31 = [v29 callStackSymbols];
        v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v39 = v28;
        __int16 v40 = 2114;
        v41 = v32;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v39 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUChannelPort _addOutputPort:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 80, @"Port is already connected: %@", v33, v34, v35, v36, (uint64_t)v37);
  }
  [(NSHashTable *)self->_outputPorts addObject:v37];
}

- (void)setInputPort:(id)a3
{
  id v4 = (_NUChannelPort *)a3;
  [(_NUChannelPort *)self->_inputPort _removeOutputPort:self];
  inputPort = self->_inputPort;
  self->_inputPort = v4;
  uint64_t v7 = v4;

  id v6 = [(_NUChannelPort *)self->_inputPort node];
  [(NUPipelineNode *)self->_node setInputNode:v6];

  [(_NUChannelPort *)self->_inputPort _addOutputPort:self];
}

- (NSArray)outputPorts
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(NSHashTable *)self->_outputPorts allObjects];
  id v4 = (void *)[v3 mutableCopy];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_subports;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "outputPorts", (void)v12);
        [v4 addObjectsFromArray:v10];
      }
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return (NSArray *)v4;
}

- (_NUChannelPort)initWithChannel:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v52.receiver = self;
  v52.super_class = (Class)_NUChannelPort;
  uint64_t v6 = [(_NUChannelPort *)&v52 init];
  objc_storeStrong((id *)&v6->_channel, a3);
  switch([v5 type])
  {
    case 0:
    case 3:
      uint64_t v27 = NUAssertLogger_5149();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        __int16 v28 = [NSString stringWithFormat:@"Invalid type for channel: %@", v5];
        *(_DWORD *)buf = 138543362;
        v54 = v28;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      id v30 = NUAssertLogger_5149();
      BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v31)
        {
          uint64_t v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          uint64_t v35 = (void *)MEMORY[0x1E4F29060];
          id v36 = v34;
          id v37 = [v35 callStackSymbols];
          v38 = [v37 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          v54 = v34;
          __int16 v55 = 2114;
          v56 = v38;
          _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v31)
      {
        v32 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v54 = v33;
        _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"-[_NUChannelPort initWithChannel:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 53, @"Invalid type for channel: %@", v39, v40, v41, v42, (uint64_t)v5);
    case 1:
      uint64_t v7 = [NUMediaNode alloc];
      uint64_t v8 = +[NUPlaceholderNode emptyNode];
      BOOL v9 = [v5 name];
      uint64_t v10 = [(NURenderTagNode *)v7 initWithInput:v8 name:v9];
      goto LABEL_13;
    case 2:
      uint64_t v8 = [v5 format];
      uint64_t v11 = [v8 controlType];
      switch(v11)
      {
        case 1:
          id v19 = [NUSettingNode alloc];
          BOOL v9 = [v8 dataModel];
          uint64_t v10 = [(NUSettingNode *)v19 initWithSetting:v9];
LABEL_13:
          node = v6->_node;
          v6->_node = (NUPipelineNode *)v10;

          break;
        case 2:
          uint64_t v20 = [NUSchemaNode alloc];
          BOOL v9 = [v8 dataModel];
          uint64_t v10 = [(NUSchemaNode *)v20 initWithSchema:v9];
          goto LABEL_13;
        case 0:
          long long v12 = NUAssertLogger_5149();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            long long v13 = [NSString stringWithFormat:@"Unsupported channel control format: %@", v8];
            *(_DWORD *)buf = 138543362;
            v54 = v13;
            _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
          }
          long long v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          long long v15 = NUAssertLogger_5149();
          BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
          if (v14)
          {
            if (v16)
            {
              v43 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
              v44 = (void *)MEMORY[0x1E4F29060];
              id v45 = v43;
              v46 = [v44 callStackSymbols];
              v47 = [v46 componentsJoinedByString:@"\n"];
              *(_DWORD *)buf = 138543618;
              v54 = v43;
              __int16 v55 = 2114;
              v56 = v47;
              _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
            }
          }
          else if (v16)
          {
            uint64_t v17 = [MEMORY[0x1E4F29060] callStackSymbols];
            v18 = [v17 componentsJoinedByString:@"\n"];
            *(_DWORD *)buf = 138543362;
            v54 = v18;
            _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
          }
          _NUAssertFailHandler((uint64_t)"-[_NUChannelPort initWithChannel:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 47, @"Unsupported channel control format: %@", v48, v49, v50, v51, (uint64_t)v8);
      }

LABEL_15:
      uint64_t v22 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:2];
      outputPorts = v6->_outputPorts;
      v6->_outputPorts = (NSHashTable *)v22;

      uint64_t v24 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:512 capacity:2];
      subports = v6->_subports;
      v6->_subports = (NSHashTable *)v24;

      return v6;
    default:
      goto LABEL_15;
  }
}

@end