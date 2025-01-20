@interface NPTPing
+ (BOOL)supportsSecureCoding;
- (NPTPing)initWithCoder:(id)a3;
- (NPTPing)initWithNetworkActivityParent:(id)a3;
- (NPTPing)initWithNetworkActivityParent:(id)a3 pingTarget:(id)a4;
- (NPTPingResult)results;
- (id)completion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)delegate;
- (void)cancel;
- (void)encodeWithCoder:(id)a3;
- (void)sendPing;
- (void)setCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setResults:(id)a3;
- (void)simplePing:(id)a3 didFailToSendPacket:(id)a4 sequenceNumber:(unsigned __int16)a5 error:(id)a6;
- (void)simplePing:(id)a3 didFailWithError:(id)a4;
- (void)simplePing:(id)a3 didReceivePingResponsePacket:(id)a4 sequenceNumber:(unsigned __int16)a5;
- (void)simplePing:(id)a3 didReceiveUnexpectedPacket:(id)a4;
- (void)simplePing:(id)a3 didTimeOut:(id)a4 sequenceNumber:(unsigned __int16)a5 error:(id)a6;
- (void)startWithNumberOfPings:(unint64_t)a3 forcingIPv4:(BOOL)a4 forcingIPv6:(BOOL)a5;
- (void)startWithNumberOfPings:(unint64_t)a3 forcingIPv4:(BOOL)a4 forcingIPv6:(BOOL)a5 completion:(id)a6;
- (void)stop;
@end

@implementation NPTPing

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPTPing)initWithNetworkActivityParent:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NPTPing;
  v6 = [(NPTPing *)&v15 init];
  if (v6)
  {
    v7 = objc_alloc_init(NPTPingResult);
    [(NPTPing *)v6 setResults:v7];

    v8 = [[SimplePing alloc] initWithHostName:@"npt.cdn-apple.com"];
    pinger = v6->pinger;
    v6->pinger = v8;

    [(SimplePing *)v6->pinger setDelegate:v6];
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    pings = v6->pings;
    v6->pings = v10;

    uint64_t v12 = nw_activity_create();
    pingActivity = v6->pingActivity;
    v6->pingActivity = (OS_nw_activity *)v12;

    objc_storeStrong((id *)&v6->activityParent, a3);
    nw_activity_set_parent_activity();
  }

  return v6;
}

- (NPTPing)initWithNetworkActivityParent:(id)a3 pingTarget:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NPTPing;
  v9 = [(NPTPing *)&v18 init];
  if (v9)
  {
    v10 = objc_alloc_init(NPTPingResult);
    [(NPTPing *)v9 setResults:v10];

    v11 = [[SimplePing alloc] initWithHostName:v8];
    pinger = v9->pinger;
    v9->pinger = v11;

    [(SimplePing *)v9->pinger setDelegate:v9];
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    pings = v9->pings;
    v9->pings = v13;

    uint64_t v15 = nw_activity_create();
    pingActivity = v9->pingActivity;
    v9->pingActivity = (OS_nw_activity *)v15;

    objc_storeStrong((id *)&v9->activityParent, a3);
    nw_activity_set_parent_activity();
  }

  return v9;
}

- (void)startWithNumberOfPings:(unint64_t)a3 forcingIPv4:(BOOL)a4 forcingIPv6:(BOOL)a5
{
}

- (void)startWithNumberOfPings:(unint64_t)a3 forcingIPv4:(BOOL)a4 forcingIPv6:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  [(NPTPing *)self setCompletion:a6];
  nw_activity_activate();
  self->pingCount = a3;
  if (v7 && !v6)
  {
    uint64_t v10 = 1;
LABEL_7:
    [(SimplePing *)self->pinger setAddressStyle:v10];
    goto LABEL_8;
  }
  if (v6 && !v7)
  {
    uint64_t v10 = 2;
    goto LABEL_7;
  }
LABEL_8:
  v11 = [(NPTPing *)self delegate];

  if (v11)
  {
    uint64_t v12 = [(NPTPing *)self delegate];
    [v12 pingWillStartPinging];
  }
  v13 = +[NPTLogger network];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134217984;
    unint64_t v15 = a3;
    _os_log_impl(&dword_219415000, v13, OS_LOG_TYPE_DEFAULT, "Will test ping latency by sending %lu pings to Apple CDN Server", (uint8_t *)&v14, 0xCu);
  }

  [(SimplePing *)self->pinger start];
}

- (void)sendPing
{
  pings = self->pings;
  v4 = objc_alloc_init(Ping);
  [(NSMutableArray *)pings addObject:v4];

  pinger = self->pinger;

  [(SimplePing *)pinger sendPingWithData:0];
}

- (void)stop
{
  v3 = [(NPTPing *)self results];
  uint64_t v4 = [v3 error];

  id v5 = [NPTPingResult alloc];
  pings = self->pings;
  BOOL v7 = [(SimplePing *)self->pinger hostName];
  id v8 = [(NPTPingResult *)v5 initWithPings:pings usingAddress:v7];
  [(NPTPing *)self setResults:v8];

  v9 = [(NPTPing *)self results];
  v59 = (void *)v4;
  [v9 setError:v4];

  [(SimplePing *)self->pinger stop];
  uint64_t v10 = [(NPTPing *)self results];
  [v10 percentLost];
  if (v11 == 0.0)
  {
    uint64_t v12 = [(NPTPing *)self results];
    v13 = [v12 pings];
    BOOL v14 = [v13 count] == self->pingCount;
  }
  else
  {

    BOOL v14 = 0;
  }
  nw_activity_complete_with_reason();
  unint64_t v15 = [(NPTPing *)self delegate];

  if (v15)
  {
    uint64_t v16 = [(NPTPing *)self delegate];
    v17 = [(NPTPing *)self results];
    [v16 pingDidFinishWithResults:v17];
  }
  objc_super v18 = [(NPTPing *)self completion];

  if (v18)
  {
    objc_initWeak(&location, self);
    if (v14)
    {
      v19 = 0;
    }
    else
    {
      v57 = NSString;
      v20 = [(NPTPing *)self results];
      v21 = [v20 pings];
      uint64_t v22 = [v21 count];
      v23 = [(NPTPing *)self results];
      v24 = [v23 pings];
      unint64_t v25 = [v24 count];
      v26 = [(NPTPing *)self results];
      [v26 percentLost];
      double v28 = v27;
      unint64_t pingCount = self->pingCount;
      v30 = [(NPTPing *)self results];
      [v30 percentLost];
      v32 = objc_msgSend(v57, "stringWithFormat:", @"Errors encountered with ping. Sent: %ld Received: %ld Expected: %lu Percent Lost: %f", v22, (unint64_t)((v28 / -100.0 + 1.0) * (double)v25), pingCount, v31);

      v33 = [(NPTPing *)self results];
      v34 = [v33 error];
      v35 = [v34 localizedDescription];

      if (v35)
      {
        v53 = NSString;
        v58 = [(NPTPing *)self results];
        v56 = [v58 error];
        v54 = [v56 localizedDescription];
        v55 = [(NPTPing *)self results];
        v36 = [v55 pings];
        uint64_t v37 = [v36 count];
        v38 = [(NPTPing *)self results];
        v39 = [v38 pings];
        unint64_t v40 = [v39 count];
        v41 = [(NPTPing *)self results];
        [v41 percentLost];
        double v43 = v42;
        unint64_t v44 = self->pingCount;
        v45 = [(NPTPing *)self results];
        [v45 percentLost];
        uint64_t v47 = [v53 stringWithFormat:@"%@. Sent: %ld Received: %ld Expected: %lu Percent Lost: %.02f", v54, v37, (unint64_t)((v43 / -100.0 + 1.0) * (double)v40), v44, v46];

        v32 = (void *)v47;
      }
      v48 = [MEMORY[0x263EFF9A0] dictionary];
      [v48 setValue:v32 forKey:*MEMORY[0x263F08320]];
      v19 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.NPTKit" code:-1 userInfo:v48];
      v49 = [(NPTPing *)self results];
      [v49 setError:v19];
    }
    v50 = [(NPTPing *)self completion];
    id v51 = objc_loadWeakRetained(&location);
    v52 = [v51 results];
    ((void (**)(void, void *, void *))v50)[2](v50, v52, v19);

    objc_destroyWeak(&location);
  }
}

- (void)simplePing:(id)a3 didReceivePingResponsePacket:(id)a4 sequenceNumber:(unsigned __int16)a5
{
  uint64_t v6 = a5;
  BOOL v7 = -[NSMutableArray objectAtIndex:](self->pings, "objectAtIndex:", a5, a4);
  [v7 setWasSuccessful:1];

  id v8 = objc_alloc_init(MEMORY[0x263EFF910]);
  v9 = [(NSMutableArray *)self->pings objectAtIndex:v6];
  [v9 setEndTime:v8];

  if ([(NSMutableArray *)self->pings count] >= self->pingCount)
  {
    [(NPTPing *)self stop];
  }
  else
  {
    [(NPTPing *)self sendPing];
  }
}

- (void)simplePing:(id)a3 didFailWithError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NPTLogger network];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[NPTPing simplePing:didFailWithError:](v6);
  }

  [v7 stop];
  v9 = [(NPTPing *)self results];
  uint64_t v10 = [v9 error];

  if (!v10)
  {
    double v11 = [(NPTPing *)self results];
    [v11 setError:v6];
  }
  uint64_t v12 = [(NPTPing *)self delegate];

  if (v12)
  {
    v13 = [(NPTPing *)self delegate];
    [v13 pingDidFinishWithError:v6];
  }
  BOOL v14 = [(NPTPing *)self completion];

  if (v14)
  {
    unint64_t v15 = [(NPTPing *)self completion];
    ((void (**)(void, void, id))v15)[2](v15, 0, v6);
  }
}

- (void)simplePing:(id)a3 didTimeOut:(id)a4 sequenceNumber:(unsigned __int16)a5 error:(id)a6
{
  unsigned int v6 = a5;
  id v8 = a6;
  v9 = +[NPTLogger network];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[NPTPing simplePing:didTimeOut:sequenceNumber:error:](v8, v6, v9);
  }

  uint64_t v10 = [(NPTPing *)self results];
  double v11 = [v10 error];

  if (!v11)
  {
    uint64_t v12 = [(NPTPing *)self results];
    [v12 setError:v8];
  }
  if (![(NSMutableArray *)self->pings count]) {
    goto LABEL_8;
  }
  v13 = [(NSMutableArray *)self->pings objectAtIndex:v6];
  [v13 setWasSuccessful:0];

  id v14 = objc_alloc_init(MEMORY[0x263EFF910]);
  unint64_t v15 = [(NSMutableArray *)self->pings objectAtIndex:v6];
  [v15 setEndTime:v14];

  if ([(NSMutableArray *)self->pings count] < self->pingCount) {
    [(NPTPing *)self sendPing];
  }
  else {
LABEL_8:
  }
    [(NPTPing *)self stop];
}

- (void)simplePing:(id)a3 didFailToSendPacket:(id)a4 sequenceNumber:(unsigned __int16)a5 error:(id)a6
{
  unsigned int v6 = a5;
  id v8 = a6;
  v9 = +[NPTLogger network];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[NPTPing simplePing:didFailToSendPacket:sequenceNumber:error:](v8);
  }

  uint64_t v10 = [(NSMutableArray *)self->pings objectAtIndex:v6];
  [v10 setWasSuccessful:0];

  id v11 = objc_alloc_init(MEMORY[0x263EFF910]);
  uint64_t v12 = [(NSMutableArray *)self->pings objectAtIndex:v6];
  [v12 setEndTime:v11];

  v13 = [(NPTPing *)self results];
  id v14 = [v13 error];

  if (!v14)
  {
    unint64_t v15 = [(NPTPing *)self results];
    [v15 setError:v8];
  }
  if ([(NSMutableArray *)self->pings count] >= self->pingCount) {
    [(NPTPing *)self stop];
  }
  else {
    [(NPTPing *)self sendPing];
  }
}

- (void)simplePing:(id)a3 didReceiveUnexpectedPacket:(id)a4
{
  id v5 = +[NPTLogger network];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[NPTPing simplePing:didReceiveUnexpectedPacket:](v5);
  }

  unsigned int v6 = [(NSMutableArray *)self->pings objectAtIndex:[(NSMutableArray *)self->pings count] - 1];
  [v6 setWasSuccessful:0];

  id v7 = objc_alloc_init(MEMORY[0x263EFF910]);
  id v8 = [(NSMutableArray *)self->pings objectAtIndex:[(NSMutableArray *)self->pings count] - 1];
  [v8 setEndTime:v7];

  if ([(NSMutableArray *)self->pings count] >= self->pingCount) {
    [(NPTPing *)self stop];
  }
  else {
    [(NPTPing *)self sendPing];
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(NPTPing *)self results];
  [v4 encodeObject:v5 forKey:@"pingResults"];
}

- (NPTPing)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NPTPing;
  id v3 = a3;
  id v4 = [(NPTPing *)&v7 init];
  id v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"pingResults", v7.receiver, v7.super_class);

  [(NPTPing *)v4 setResults:v5];
  return v4;
}

- (void)cancel
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NPTPing allocWithZone:a3] init];
  id v5 = [(NPTPing *)self results];
  [(NPTPing *)v4 setResults:v5];

  return v4;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NPTPingResult)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->pingActivity, 0);
  objc_storeStrong((id *)&self->activityParent, 0);
  objc_storeStrong((id *)&self->pings, 0);

  objc_storeStrong((id *)&self->pinger, 0);
}

- (void)simplePing:(void *)a1 didFailWithError:.cold.1(void *a1)
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_0_0(&dword_219415000, v2, v3, "Failed to send pings with error: %{public}@", v4, v5, v6, v7, 2u);
}

- (void)simplePing:(NSObject *)a3 didTimeOut:sequenceNumber:error:.cold.1(void *a1, unsigned __int16 a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 localizedDescription];
  int v6 = 138543618;
  uint64_t v7 = v5;
  __int16 v8 = 1024;
  int v9 = a2;
  _os_log_error_impl(&dword_219415000, a3, OS_LOG_TYPE_ERROR, "Time out with error: %{public}@ , Sequence Number %hu", (uint8_t *)&v6, 0x12u);
}

- (void)simplePing:(void *)a1 didFailToSendPacket:sequenceNumber:error:.cold.1(void *a1)
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_0_0(&dword_219415000, v2, v3, "Failed to send packet with error: %{public}@", v4, v5, v6, v7, 2u);
}

- (void)simplePing:(os_log_t)log didReceiveUnexpectedPacket:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_219415000, log, OS_LOG_TYPE_ERROR, "Ping not successful: Did receive unexpected packet", v1, 2u);
}

@end