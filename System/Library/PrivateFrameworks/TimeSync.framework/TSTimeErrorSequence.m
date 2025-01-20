@interface TSTimeErrorSequence
+ (id)timeErrorSequenceWithTimestamps:(unint64_t *)a3 timeError:(int64_t *)a4 count:(int64_t)a5;
- (BOOL)exportTimeErrorsToDirectoryURL:(id)a3;
- (BOOL)exportTimeErrorsToDirectoryURL:(id)a3 withFilename:(id)a4;
- (NSArray)timeErrors;
- (TSTimeErrorSequence)initWithTimeErrors:(id)a3;
- (id)generatePythonScriptWithOutputPath:(id)a3 fileName:(id)a4 titleName:(id)a5 plotPath:(id)a6 showPlot:(BOOL)a7;
@end

@implementation TSTimeErrorSequence

+ (id)timeErrorSequenceWithTimestamps:(unint64_t *)a3 timeError:(int64_t *)a4 count:(int64_t)a5
{
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a3 && a4 && a5 >= 1)
  {
    do
    {
      v9 = [TSTimeErrorValue alloc];
      uint64_t v11 = *a3++;
      uint64_t v10 = v11;
      uint64_t v12 = *a4++;
      v13 = [(TSTimeErrorValue *)v9 initWithTimestamp:v10 andError:v12];
      [v8 addObject:v13];

      --a5;
    }
    while (a5);
  }
  v14 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTimeErrors:v8];

  return v14;
}

- (TSTimeErrorSequence)initWithTimeErrors:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TSTimeErrorSequence;
  v5 = [(TSTimeErrorSequence *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v4];
    timeErrors = v5->_timeErrors;
    v5->_timeErrors = (NSArray *)v6;
  }
  return v5;
}

- (id)generatePythonScriptWithOutputPath:(id)a3 fileName:(id)a4 titleName:(id)a5 plotPath:(id)a6 showPlot:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a3;
  id v12 = a6;
  v13 = (void *)MEMORY[0x1E4F28E78];
  id v14 = a5;
  id v15 = a4;
  v16 = [v13 string];
  [v16 appendFormat:@"#!/usr/bin/env python3\n\nimport numpy as np\nimport matplotlib.pyplot as plt\nimport os\nimport sys\n"];
  if (v11) {
    [NSString stringWithFormat:@"'%@/%@'", v11, v15];
  }
  else {
  v17 = [NSString stringWithFormat:@"os.path.split(sys.argv[0])[0]+'/%@'", v15, v19];
  }

  [v16 appendFormat:@"timeErrorRecords = np.recfromtxt(%@, dtype=None, delimiter=',', names=True, encoding='utf-8')\n\ntime = timeErrorRecords.time\ntimeError = timeErrorRecords.time_error\n\n", v17];
  [v16 appendFormat:@"f1, ax1 = plt.subplots()\nax1.plot(time, timeError, 'r-')\nax1.set_ylabel('Time Error (ns)')\nax1.set_xlabel('Time (ns)')\nax1.set_title('Time Errors - %@')\nax1.grid(True)\n\nplt.subplots_adjust(left=0.05, right=0.97, bottom=0.05, top=0.97)\n", v14];

  if (v12) {
    [v16 appendFormat:@"\nf1.set_size_inches(32, 16.98753)\n\nf1.savefig('%@')\n", v12];
  }
  if (v7) {
    [v16 appendString:@"\nplt.show()\n"];
  }

  return v16;
}

- (BOOL)exportTimeErrorsToDirectoryURL:(id)a3
{
  return [(TSTimeErrorSequence *)self exportTimeErrorsToDirectoryURL:a3 withFilename:@"time_errors.csv"];
}

- (BOOL)exportTimeErrorsToDirectoryURL:(id)a3 withFilename:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 isFileURL])
  {
    id v8 = [v6 path];
    objc_super v9 = [v8 stringByAppendingPathComponent:v7];

    id v10 = v9;
    id v11 = fopen((const char *)[v10 UTF8String], "w");
    BOOL v12 = v11 != 0;
    if (v11)
    {
      v13 = v11;
      id v20 = v10;
      BOOL v21 = v11 != 0;
      fwrite("time,time error\n", 0x10uLL, 1uLL, v11);
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v14 = [(TSTimeErrorSequence *)self timeErrors];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v23 != v17) {
              objc_enumerationMutation(v14);
            }
            fprintf(v13, "%llu,%lld\n", [*(id *)(*((void *)&v22 + 1) + 8 * i) timestamp], objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "error"));
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v16);
      }

      fclose(v13);
      BOOL v12 = v21;
      id v10 = v20;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (NSArray)timeErrors
{
  return self->_timeErrors;
}

- (void).cxx_destruct
{
}

@end