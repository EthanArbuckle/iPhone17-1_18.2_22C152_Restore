@interface SFFlightLeg
+ (BOOL)supportsSecureCoding;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDate)arrivalActualTime;
- (NSDate)arrivalGateTime;
- (NSDate)arrivalPublishedTime;
- (NSDate)arrivalRunwayTime;
- (NSDate)departureActualTime;
- (NSDate)departureGateClosedTime;
- (NSDate)departurePublishedTime;
- (NSDate)departureRunwayTime;
- (NSDictionary)dictionaryRepresentation;
- (NSString)arrivalGate;
- (NSString)arrivalTerminal;
- (NSString)baggageClaim;
- (NSString)departureGate;
- (NSString)departureTerminal;
- (NSString)title;
- (SFAirport)arrivalAirport;
- (SFAirport)departureAirport;
- (SFAirport)divertedAirport;
- (SFFlightLeg)initWithCoder:(id)a3;
- (SFFlightLeg)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)status;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setArrivalActualTime:(id)a3;
- (void)setArrivalAirport:(id)a3;
- (void)setArrivalGate:(id)a3;
- (void)setArrivalGateTime:(id)a3;
- (void)setArrivalPublishedTime:(id)a3;
- (void)setArrivalRunwayTime:(id)a3;
- (void)setArrivalTerminal:(id)a3;
- (void)setBaggageClaim:(id)a3;
- (void)setDepartureActualTime:(id)a3;
- (void)setDepartureAirport:(id)a3;
- (void)setDepartureGate:(id)a3;
- (void)setDepartureGateClosedTime:(id)a3;
- (void)setDeparturePublishedTime:(id)a3;
- (void)setDepartureRunwayTime:(id)a3;
- (void)setDepartureTerminal:(id)a3;
- (void)setDivertedAirport:(id)a3;
- (void)setStatus:(int)a3;
- (void)setTitle:(id)a3;
@end

@implementation SFFlightLeg

- (SFFlightLeg)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)SFFlightLeg;
  v5 = [(SFFlightLeg *)&v64 init];
  if (v5)
  {
    if ([v4 status]) {
      -[SFFlightLeg setStatus:](v5, "setStatus:", [v4 status]);
    }
    v6 = [v4 departurePublishedTime];

    if (v6)
    {
      v7 = [v4 departurePublishedTime];
      v8 = (void *)MEMORY[0x1E4F1C9C8];
      [v7 secondsSince1970];
      v9 = objc_msgSend(v8, "dateWithTimeIntervalSince1970:");
      [(SFFlightLeg *)v5 setDeparturePublishedTime:v9];
    }
    v10 = [v4 departureActualTime];

    if (v10)
    {
      v11 = [v4 departureActualTime];
      v12 = (void *)MEMORY[0x1E4F1C9C8];
      [v11 secondsSince1970];
      v13 = objc_msgSend(v12, "dateWithTimeIntervalSince1970:");
      [(SFFlightLeg *)v5 setDepartureActualTime:v13];
    }
    v14 = [v4 departureTerminal];

    if (v14)
    {
      v15 = [v4 departureTerminal];
      [(SFFlightLeg *)v5 setDepartureTerminal:v15];
    }
    v16 = [v4 departureGate];

    if (v16)
    {
      v17 = [v4 departureGate];
      [(SFFlightLeg *)v5 setDepartureGate:v17];
    }
    v18 = [v4 departureAirport];

    if (v18)
    {
      v19 = [SFAirport alloc];
      v20 = [v4 departureAirport];
      v21 = [(SFAirport *)v19 initWithProtobuf:v20];
      [(SFFlightLeg *)v5 setDepartureAirport:v21];
    }
    v22 = [v4 arrivalPublishedTime];

    if (v22)
    {
      v23 = [v4 arrivalPublishedTime];
      v24 = (void *)MEMORY[0x1E4F1C9C8];
      [v23 secondsSince1970];
      v25 = objc_msgSend(v24, "dateWithTimeIntervalSince1970:");
      [(SFFlightLeg *)v5 setArrivalPublishedTime:v25];
    }
    v26 = [v4 arrivalActualTime];

    if (v26)
    {
      v27 = [v4 arrivalActualTime];
      v28 = (void *)MEMORY[0x1E4F1C9C8];
      [v27 secondsSince1970];
      v29 = objc_msgSend(v28, "dateWithTimeIntervalSince1970:");
      [(SFFlightLeg *)v5 setArrivalActualTime:v29];
    }
    v30 = [v4 arrivalTerminal];

    if (v30)
    {
      v31 = [v4 arrivalTerminal];
      [(SFFlightLeg *)v5 setArrivalTerminal:v31];
    }
    v32 = [v4 arrivalGate];

    if (v32)
    {
      v33 = [v4 arrivalGate];
      [(SFFlightLeg *)v5 setArrivalGate:v33];
    }
    v34 = [v4 arrivalAirport];

    if (v34)
    {
      v35 = [SFAirport alloc];
      v36 = [v4 arrivalAirport];
      v37 = [(SFAirport *)v35 initWithProtobuf:v36];
      [(SFFlightLeg *)v5 setArrivalAirport:v37];
    }
    v38 = [v4 divertedAirport];

    if (v38)
    {
      v39 = [SFAirport alloc];
      v40 = [v4 divertedAirport];
      v41 = [(SFAirport *)v39 initWithProtobuf:v40];
      [(SFFlightLeg *)v5 setDivertedAirport:v41];
    }
    v42 = [v4 title];

    if (v42)
    {
      v43 = [v4 title];
      [(SFFlightLeg *)v5 setTitle:v43];
    }
    v44 = [v4 baggageClaim];

    if (v44)
    {
      v45 = [v4 baggageClaim];
      [(SFFlightLeg *)v5 setBaggageClaim:v45];
    }
    v46 = [v4 departureGateClosedTime];

    if (v46)
    {
      v47 = [v4 departureGateClosedTime];
      v48 = (void *)MEMORY[0x1E4F1C9C8];
      [v47 secondsSince1970];
      v49 = objc_msgSend(v48, "dateWithTimeIntervalSince1970:");
      [(SFFlightLeg *)v5 setDepartureGateClosedTime:v49];
    }
    v50 = [v4 departureRunwayTime];

    if (v50)
    {
      v51 = [v4 departureRunwayTime];
      v52 = (void *)MEMORY[0x1E4F1C9C8];
      [v51 secondsSince1970];
      v53 = objc_msgSend(v52, "dateWithTimeIntervalSince1970:");
      [(SFFlightLeg *)v5 setDepartureRunwayTime:v53];
    }
    v54 = [v4 arrivalRunwayTime];

    if (v54)
    {
      v55 = [v4 arrivalRunwayTime];
      v56 = (void *)MEMORY[0x1E4F1C9C8];
      [v55 secondsSince1970];
      v57 = objc_msgSend(v56, "dateWithTimeIntervalSince1970:");
      [(SFFlightLeg *)v5 setArrivalRunwayTime:v57];
    }
    v58 = [v4 arrivalGateTime];

    if (v58)
    {
      v59 = [v4 arrivalGateTime];
      v60 = (void *)MEMORY[0x1E4F1C9C8];
      [v59 secondsSince1970];
      v61 = objc_msgSend(v60, "dateWithTimeIntervalSince1970:");
      [(SFFlightLeg *)v5 setArrivalGateTime:v61];
    }
    v62 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivalGateTime, 0);
  objc_storeStrong((id *)&self->_arrivalRunwayTime, 0);
  objc_storeStrong((id *)&self->_departureRunwayTime, 0);
  objc_storeStrong((id *)&self->_departureGateClosedTime, 0);
  objc_storeStrong((id *)&self->_baggageClaim, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_divertedAirport, 0);
  objc_storeStrong((id *)&self->_arrivalAirport, 0);
  objc_storeStrong((id *)&self->_arrivalGate, 0);
  objc_storeStrong((id *)&self->_arrivalTerminal, 0);
  objc_storeStrong((id *)&self->_arrivalActualTime, 0);
  objc_storeStrong((id *)&self->_arrivalPublishedTime, 0);
  objc_storeStrong((id *)&self->_departureAirport, 0);
  objc_storeStrong((id *)&self->_departureGate, 0);
  objc_storeStrong((id *)&self->_departureTerminal, 0);
  objc_storeStrong((id *)&self->_departureActualTime, 0);
  objc_storeStrong((id *)&self->_departurePublishedTime, 0);
}

- (void)setArrivalGateTime:(id)a3
{
}

- (NSDate)arrivalGateTime
{
  return self->_arrivalGateTime;
}

- (void)setArrivalRunwayTime:(id)a3
{
}

- (NSDate)arrivalRunwayTime
{
  return self->_arrivalRunwayTime;
}

- (void)setDepartureRunwayTime:(id)a3
{
}

- (NSDate)departureRunwayTime
{
  return self->_departureRunwayTime;
}

- (void)setDepartureGateClosedTime:(id)a3
{
}

- (NSDate)departureGateClosedTime
{
  return self->_departureGateClosedTime;
}

- (void)setBaggageClaim:(id)a3
{
}

- (NSString)baggageClaim
{
  return self->_baggageClaim;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setDivertedAirport:(id)a3
{
}

- (SFAirport)divertedAirport
{
  return self->_divertedAirport;
}

- (void)setArrivalAirport:(id)a3
{
}

- (SFAirport)arrivalAirport
{
  return self->_arrivalAirport;
}

- (void)setArrivalGate:(id)a3
{
}

- (NSString)arrivalGate
{
  return self->_arrivalGate;
}

- (void)setArrivalTerminal:(id)a3
{
}

- (NSString)arrivalTerminal
{
  return self->_arrivalTerminal;
}

- (void)setArrivalActualTime:(id)a3
{
}

- (NSDate)arrivalActualTime
{
  return self->_arrivalActualTime;
}

- (void)setArrivalPublishedTime:(id)a3
{
}

- (NSDate)arrivalPublishedTime
{
  return self->_arrivalPublishedTime;
}

- (void)setDepartureAirport:(id)a3
{
}

- (SFAirport)departureAirport
{
  return self->_departureAirport;
}

- (void)setDepartureGate:(id)a3
{
}

- (NSString)departureGate
{
  return self->_departureGate;
}

- (void)setDepartureTerminal:(id)a3
{
}

- (NSString)departureTerminal
{
  return self->_departureTerminal;
}

- (void)setDepartureActualTime:(id)a3
{
}

- (NSDate)departureActualTime
{
  return self->_departureActualTime;
}

- (void)setDeparturePublishedTime:(id)a3
{
}

- (NSDate)departurePublishedTime
{
  return self->_departurePublishedTime;
}

- (int)status
{
  return self->_status;
}

- (unint64_t)hash
{
  uint64_t v3 = [(SFFlightLeg *)self status];
  v38 = [(SFFlightLeg *)self departurePublishedTime];
  uint64_t v4 = [v38 hash] ^ v3;
  v37 = [(SFFlightLeg *)self departureActualTime];
  uint64_t v5 = [v37 hash];
  v36 = [(SFFlightLeg *)self departureTerminal];
  uint64_t v6 = v4 ^ v5 ^ [v36 hash];
  v35 = [(SFFlightLeg *)self departureGate];
  uint64_t v7 = [v35 hash];
  v34 = [(SFFlightLeg *)self departureAirport];
  uint64_t v8 = v7 ^ [v34 hash];
  v33 = [(SFFlightLeg *)self arrivalPublishedTime];
  uint64_t v9 = v6 ^ v8 ^ [v33 hash];
  v32 = [(SFFlightLeg *)self arrivalActualTime];
  uint64_t v10 = [v32 hash];
  v31 = [(SFFlightLeg *)self arrivalTerminal];
  uint64_t v11 = v10 ^ [v31 hash];
  v30 = [(SFFlightLeg *)self arrivalGate];
  uint64_t v12 = v11 ^ [v30 hash];
  v29 = [(SFFlightLeg *)self arrivalAirport];
  uint64_t v13 = v9 ^ v12 ^ [v29 hash];
  v14 = [(SFFlightLeg *)self divertedAirport];
  uint64_t v15 = [v14 hash];
  v16 = [(SFFlightLeg *)self title];
  uint64_t v17 = v15 ^ [v16 hash];
  v18 = [(SFFlightLeg *)self baggageClaim];
  uint64_t v19 = v17 ^ [v18 hash];
  v20 = [(SFFlightLeg *)self departureGateClosedTime];
  uint64_t v21 = v19 ^ [v20 hash];
  v22 = [(SFFlightLeg *)self departureRunwayTime];
  uint64_t v23 = v13 ^ v21 ^ [v22 hash];
  v24 = [(SFFlightLeg *)self arrivalRunwayTime];
  uint64_t v25 = [v24 hash];
  v26 = [(SFFlightLeg *)self arrivalGateTime];
  unint64_t v27 = v23 ^ v25 ^ [v26 hash];

  return v27;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v7 = (SFFlightLeg *)a3;
  if (self == v7)
  {
    char v17 = 1;
    goto LABEL_114;
  }
  if (![(SFFlightLeg *)v7 isMemberOfClass:objc_opt_class()])
  {
    char v17 = 0;
    goto LABEL_114;
  }
  uint64_t v8 = v7;
  int v9 = [(SFFlightLeg *)self status];
  uint64_t v10 = [(SFFlightLeg *)v8 status];
  int v154 = v10;
  int v155 = v9;
  if (v9 != v10
    || ([(SFFlightLeg *)self departurePublishedTime],
        v133 = objc_claimAutoreleasedReturnValue(),
        [(SFFlightLeg *)v8 departurePublishedTime],
        v132 = objc_claimAutoreleasedReturnValue(),
        (v133 == 0) == (v132 != 0)))
  {
    long long v153 = 0uLL;
    long long v150 = 0uLL;
    memset(v149, 0, sizeof(v149));
    int v151 = 0;
    uint64_t v147 = 0;
    uint64_t v145 = 0;
    int v142 = 0;
    memset(v161, 0, 12);
    int v137 = 0;
    int v143 = 0;
    BOOL v160 = 0;
    int v135 = 0;
    int v140 = 0;
    BOOL v159 = 0;
    int v134 = 0;
    int v139 = 0;
    BOOL v158 = 0;
    int v136 = 0;
    int v141 = 0;
    BOOL v157 = 0;
    int v138 = 0;
    uint64_t v144 = 0;
    BOOL v156 = 0;
    uint64_t v146 = 0;
    uint64_t v152 = 0;
    uint64_t v148 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    char v17 = 0;
  }
  else
  {
    uint64_t v11 = [(SFFlightLeg *)self departurePublishedTime];
    uint64_t v3 = v11 != 0;
    v131 = (void *)v11;
    if (!v11
      || ([(SFFlightLeg *)self departurePublishedTime],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          [(SFFlightLeg *)v8 departurePublishedTime],
          v128 = v12,
          v127 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v12, "isEqual:")))
    {
      v130 = [(SFFlightLeg *)self departureActualTime];
      v129 = [(SFFlightLeg *)v8 departureActualTime];
      HIDWORD(v153) = v3;
      if ((v130 == 0) == (v129 != 0))
      {
        *((void *)&v150 + 1) = 0x100000000;
        *(void *)((char *)&v153 + 4) = 0;
        *(void *)&long long v150 = 0x100000000;
        LODWORD(v153) = 0;
        memset(v149, 0, sizeof(v149));
        int v151 = 0;
        uint64_t v147 = 0;
        uint64_t v145 = 0;
        int v142 = 0;
        memset(v161, 0, 12);
        int v137 = 0;
        int v143 = 0;
        BOOL v160 = 0;
        int v135 = 0;
        int v140 = 0;
        BOOL v159 = 0;
        int v134 = 0;
        int v139 = 0;
        BOOL v158 = 0;
        int v136 = 0;
        int v141 = 0;
        BOOL v157 = 0;
        int v138 = 0;
        uint64_t v144 = 0;
        BOOL v156 = 0;
        uint64_t v146 = 0;
        uint64_t v152 = 0;
        uint64_t v148 = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        char v17 = 0;
      }
      else
      {
        uint64_t v22 = [(SFFlightLeg *)self departureActualTime];
        BOOL v23 = v22 != 0;
        v126 = (void *)v22;
        if (!v22
          || ([(SFFlightLeg *)self departureActualTime],
              v24 = objc_claimAutoreleasedReturnValue(),
              [(SFFlightLeg *)v8 departureActualTime],
              v123 = v24,
              v122 = objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v24, "isEqual:")))
        {
          v125 = [(SFFlightLeg *)self departureTerminal];
          v124 = [(SFFlightLeg *)v8 departureTerminal];
          DWORD2(v153) = v23;
          if ((v125 == 0) == (v124 != 0))
          {
            *(void *)&long long v150 = 0x100000000;
            *(void *)&long long v153 = 0;
            int v151 = 0;
            uint64_t v147 = 0;
            memset(v149, 0, 20);
            uint64_t v145 = 0;
            int v142 = 0;
            memset(v161, 0, 12);
            int v137 = 0;
            int v143 = 0;
            BOOL v160 = 0;
            int v135 = 0;
            int v140 = 0;
            BOOL v159 = 0;
            int v134 = 0;
            int v139 = 0;
            BOOL v158 = 0;
            int v136 = 0;
            int v141 = 0;
            BOOL v157 = 0;
            int v138 = 0;
            uint64_t v144 = 0;
            BOOL v156 = 0;
            uint64_t v146 = 0;
            uint64_t v152 = 0;
            uint64_t v148 = 0;
            int v13 = 0;
            int v14 = 0;
            int v15 = 0;
            int v16 = 0;
            char v17 = 0;
            *((void *)&v150 + 1) = 0x100000001;
            *(void *)&v149[20] = 1;
          }
          else
          {
            uint64_t v25 = [(SFFlightLeg *)self departureTerminal];
            uint64_t v4 = v25 != 0;
            v121 = (void *)v25;
            if (!v25
              || ([(SFFlightLeg *)self departureTerminal],
                  v26 = objc_claimAutoreleasedReturnValue(),
                  [(SFFlightLeg *)v8 departureTerminal],
                  v118 = v26,
                  v117 = objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v26, "isEqual:")))
            {
              v120 = [(SFFlightLeg *)self departureGate];
              v119 = [(SFFlightLeg *)v8 departureGate];
              DWORD1(v153) = v4;
              if ((v120 == 0) == (v119 != 0))
              {
                *(void *)&v149[16] = 0x100000000;
                LODWORD(v153) = 0;
                *(void *)&v149[4] = 0;
                int v151 = 0;
                uint64_t v147 = 0;
                *(_DWORD *)v149 = 0;
                uint64_t v145 = 0;
                int v142 = 0;
                memset(v161, 0, 12);
                int v137 = 0;
                int v143 = 0;
                BOOL v160 = 0;
                int v135 = 0;
                int v140 = 0;
                BOOL v159 = 0;
                int v134 = 0;
                int v139 = 0;
                BOOL v158 = 0;
                int v136 = 0;
                int v141 = 0;
                BOOL v157 = 0;
                int v138 = 0;
                uint64_t v144 = 0;
                BOOL v156 = 0;
                uint64_t v146 = 0;
                uint64_t v152 = 0;
                uint64_t v148 = 0;
                int v13 = 0;
                int v14 = 0;
                int v15 = 0;
                int v16 = 0;
                char v17 = 0;
                *((void *)&v150 + 1) = 0x100000001;
                *(void *)&long long v150 = 0x100000001;
                *(_DWORD *)&v149[24] = 0;
                *(_DWORD *)&v149[12] = 1;
              }
              else
              {
                uint64_t v27 = [(SFFlightLeg *)self departureGate];
                uint64_t v5 = v27 != 0;
                v116 = (void *)v27;
                if (!v27
                  || ([(SFFlightLeg *)self departureGate],
                      v28 = objc_claimAutoreleasedReturnValue(),
                      [(SFFlightLeg *)v8 departureGate],
                      v112 = objc_claimAutoreleasedReturnValue(),
                      v113 = v28,
                      objc_msgSend(v28, "isEqual:")))
                {
                  v115 = [(SFFlightLeg *)self departureAirport];
                  v114 = [(SFFlightLeg *)v8 departureAirport];
                  LODWORD(v153) = v5;
                  if ((v115 == 0) != (v114 != 0))
                  {
                    uint64_t v29 = [(SFFlightLeg *)self departureAirport];
                    BOOL v30 = v29 != 0;
                    v111 = (void *)v29;
                    if (v29)
                    {
                      uint64_t v5 = [(SFFlightLeg *)self departureAirport];
                      v107 = [(SFFlightLeg *)v8 departureAirport];
                      v108 = (void *)v5;
                      if (!objc_msgSend((id)v5, "isEqual:"))
                      {
                        uint64_t v147 = 0;
                        *(void *)v149 = 0x100000000;
                        uint64_t v145 = 0;
                        int v142 = 0;
                        memset(v161, 0, 12);
                        int v137 = 0;
                        int v143 = 0;
                        BOOL v160 = 0;
                        int v135 = 0;
                        int v140 = 0;
                        BOOL v159 = 0;
                        int v134 = 0;
                        int v139 = 0;
                        BOOL v158 = 0;
                        int v136 = 0;
                        int v141 = 0;
                        BOOL v157 = 0;
                        int v138 = 0;
                        uint64_t v144 = 0;
                        BOOL v156 = 0;
                        uint64_t v146 = 0;
                        uint64_t v152 = 0;
                        uint64_t v148 = 0;
                        int v13 = 0;
                        int v14 = 0;
                        int v15 = 0;
                        int v16 = 0;
                        char v17 = 0;
                        *((void *)&v150 + 1) = 0x100000001;
                        *(void *)&long long v150 = 0x100000001;
                        *(_DWORD *)&v149[24] = 0;
                        *(void *)&v149[16] = 0x100000001;
                        *(void *)&v149[8] = 0x100000001;
                        int v151 = 1;
                        goto LABEL_11;
                      }
                      int v151 = v30;
                    }
                    else
                    {
                      int v151 = 0;
                    }
                    uint64_t v5 = [(SFFlightLeg *)self arrivalPublishedTime];
                    v109 = [(SFFlightLeg *)v8 arrivalPublishedTime];
                    v110 = (void *)v5;
                    if ((v5 == 0) == (v109 != 0))
                    {
                      *(void *)v149 = 0x100000000;
                      uint64_t v145 = 0;
                      uint64_t v147 = 0x100000000;
                      int v142 = 0;
                      memset(v161, 0, 12);
                      int v137 = 0;
                      int v143 = 0;
                      BOOL v160 = 0;
                      int v135 = 0;
                      int v140 = 0;
                      BOOL v159 = 0;
                      int v134 = 0;
                      int v139 = 0;
                      BOOL v158 = 0;
                      int v136 = 0;
                      int v141 = 0;
                      BOOL v157 = 0;
                      int v138 = 0;
                      uint64_t v144 = 0;
                      BOOL v156 = 0;
                      uint64_t v146 = 0;
                      uint64_t v152 = 0;
                      uint64_t v148 = 0;
                      int v13 = 0;
                      int v14 = 0;
                      int v15 = 0;
                      int v16 = 0;
                      char v17 = 0;
                      *((void *)&v150 + 1) = 0x100000001;
                      *(void *)&long long v150 = 0x100000001;
                      *(_DWORD *)&v149[24] = 0;
                      *(void *)&v149[16] = 0x100000001;
                      *(void *)&v149[8] = 0x100000001;
                    }
                    else
                    {
                      uint64_t v31 = [(SFFlightLeg *)self arrivalPublishedTime];
                      LODWORD(v161[1]) = v31 != 0;
                      v106 = (void *)v31;
                      if (!v31
                        || ([(SFFlightLeg *)self arrivalPublishedTime],
                            v32 = objc_claimAutoreleasedReturnValue(),
                            [(SFFlightLeg *)v8 arrivalPublishedTime],
                            v102 = objc_claimAutoreleasedReturnValue(),
                            v103 = v32,
                            objc_msgSend(v32, "isEqual:")))
                      {
                        v105 = [(SFFlightLeg *)self arrivalActualTime];
                        v104 = [(SFFlightLeg *)v8 arrivalActualTime];
                        if ((v105 == 0) == (v104 != 0))
                        {
                          uint64_t v147 = 0x100000000;
                          v161[0] = 0;
                          int v142 = 0;
                          uint64_t v145 = 0x100000000;
                          int v137 = 0;
                          int v143 = 0;
                          BOOL v160 = 0;
                          int v135 = 0;
                          int v140 = 0;
                          BOOL v159 = 0;
                          int v134 = 0;
                          int v139 = 0;
                          BOOL v158 = 0;
                          int v136 = 0;
                          int v141 = 0;
                          BOOL v157 = 0;
                          int v138 = 0;
                          uint64_t v144 = 0;
                          BOOL v156 = 0;
                          uint64_t v146 = 0;
                          uint64_t v152 = 0;
                          uint64_t v148 = 0;
                          int v13 = 0;
                          int v14 = 0;
                          int v15 = 0;
                          int v16 = 0;
                          char v17 = 0;
                          *((void *)&v150 + 1) = 0x100000001;
                          *(void *)&long long v150 = 0x100000001;
                          *(_DWORD *)&v149[24] = 0;
                          *(void *)&v149[16] = 0x100000001;
                          *(void *)&v149[8] = 0x100000001;
                          *(void *)v149 = 0x100000001;
                        }
                        else
                        {
                          uint64_t v33 = [(SFFlightLeg *)self arrivalActualTime];
                          HIDWORD(v161[0]) = v33 != 0;
                          v101 = (void *)v33;
                          if (!v33
                            || ([(SFFlightLeg *)self arrivalActualTime],
                                v34 = objc_claimAutoreleasedReturnValue(),
                                [(SFFlightLeg *)v8 arrivalActualTime],
                                v97 = objc_claimAutoreleasedReturnValue(),
                                v98 = v34,
                                objc_msgSend(v34, "isEqual:")))
                          {
                            v100 = [(SFFlightLeg *)self arrivalTerminal];
                            v99 = [(SFFlightLeg *)v8 arrivalTerminal];
                            if ((v100 == 0) == (v99 != 0))
                            {
                              uint64_t v145 = 0x100000000;
                              LODWORD(v161[0]) = 0;
                              int v137 = 0;
                              int v143 = 0;
                              BOOL v160 = 0;
                              int v135 = 0;
                              int v140 = 0;
                              BOOL v159 = 0;
                              int v134 = 0;
                              int v139 = 0;
                              BOOL v158 = 0;
                              int v136 = 0;
                              int v141 = 0;
                              BOOL v157 = 0;
                              int v138 = 0;
                              uint64_t v144 = 0;
                              BOOL v156 = 0;
                              uint64_t v146 = 0;
                              uint64_t v152 = 0;
                              uint64_t v148 = 0;
                              int v13 = 0;
                              int v14 = 0;
                              int v15 = 0;
                              int v16 = 0;
                              char v17 = 0;
                              *((void *)&v150 + 1) = 0x100000001;
                              *(void *)&long long v150 = 0x100000001;
                              *(_DWORD *)&v149[24] = 0;
                              *(void *)&v149[16] = 0x100000001;
                              *(void *)&v149[8] = 0x100000001;
                              uint64_t v147 = 0x100000001;
                              *(void *)v149 = 0x100000001;
                              int v142 = 1;
                            }
                            else
                            {
                              uint64_t v35 = [(SFFlightLeg *)self arrivalTerminal];
                              LODWORD(v161[0]) = v35 != 0;
                              v96 = (void *)v35;
                              if (!v35
                                || ([(SFFlightLeg *)self arrivalTerminal],
                                    v36 = objc_claimAutoreleasedReturnValue(),
                                    [(SFFlightLeg *)v8 arrivalTerminal],
                                    v92 = objc_claimAutoreleasedReturnValue(),
                                    v93 = v36,
                                    objc_msgSend(v36, "isEqual:")))
                              {
                                v95 = [(SFFlightLeg *)self arrivalGate];
                                v94 = [(SFFlightLeg *)v8 arrivalGate];
                                if ((v95 == 0) == (v94 != 0))
                                {
                                  int v143 = 0;
                                  BOOL v160 = 0;
                                  int v135 = 0;
                                  int v140 = 0;
                                  BOOL v159 = 0;
                                  int v134 = 0;
                                  int v139 = 0;
                                  BOOL v158 = 0;
                                  int v136 = 0;
                                  int v141 = 0;
                                  BOOL v157 = 0;
                                  int v138 = 0;
                                  uint64_t v144 = 0;
                                  BOOL v156 = 0;
                                  uint64_t v146 = 0;
                                  uint64_t v152 = 0;
                                  uint64_t v148 = 0;
                                  int v13 = 0;
                                  int v14 = 0;
                                  int v15 = 0;
                                  int v16 = 0;
                                  char v17 = 0;
                                  *((void *)&v150 + 1) = 0x100000001;
                                  *(void *)&long long v150 = 0x100000001;
                                  *(_DWORD *)&v149[24] = 0;
                                  *(void *)&v149[16] = 0x100000001;
                                  *(void *)&v149[8] = 0x100000001;
                                  uint64_t v147 = 0x100000001;
                                  *(void *)v149 = 0x100000001;
                                  uint64_t v145 = 0x100000001;
                                  int v142 = 1;
                                  int v137 = 1;
                                }
                                else
                                {
                                  uint64_t v37 = [(SFFlightLeg *)self arrivalGate];
                                  BOOL v160 = v37 != 0;
                                  v91 = (void *)v37;
                                  if (!v37
                                    || ([(SFFlightLeg *)self arrivalGate],
                                        v38 = objc_claimAutoreleasedReturnValue(),
                                        [(SFFlightLeg *)v8 arrivalGate],
                                        v87 = objc_claimAutoreleasedReturnValue(),
                                        v88 = v38,
                                        objc_msgSend(v38, "isEqual:")))
                                  {
                                    v90 = [(SFFlightLeg *)self arrivalAirport];
                                    v89 = [(SFFlightLeg *)v8 arrivalAirport];
                                    if ((v90 == 0) == (v89 != 0))
                                    {
                                      int v140 = 0;
                                      BOOL v159 = 0;
                                      int v134 = 0;
                                      int v139 = 0;
                                      BOOL v158 = 0;
                                      int v136 = 0;
                                      int v141 = 0;
                                      BOOL v157 = 0;
                                      int v138 = 0;
                                      uint64_t v144 = 0;
                                      BOOL v156 = 0;
                                      uint64_t v146 = 0;
                                      uint64_t v152 = 0;
                                      uint64_t v148 = 0;
                                      int v13 = 0;
                                      int v14 = 0;
                                      int v15 = 0;
                                      int v16 = 0;
                                      char v17 = 0;
                                      *((void *)&v150 + 1) = 0x100000001;
                                      *(void *)&long long v150 = 0x100000001;
                                      *(_DWORD *)&v149[24] = 0;
                                      *(void *)&v149[16] = 0x100000001;
                                      *(void *)&v149[8] = 0x100000001;
                                      uint64_t v147 = 0x100000001;
                                      *(void *)v149 = 0x100000001;
                                      uint64_t v145 = 0x100000001;
                                      int v142 = 1;
                                      int v137 = 1;
                                      int v143 = 1;
                                      int v135 = 1;
                                    }
                                    else
                                    {
                                      uint64_t v39 = [(SFFlightLeg *)self arrivalAirport];
                                      BOOL v159 = v39 != 0;
                                      v86 = (void *)v39;
                                      if (!v39
                                        || ([(SFFlightLeg *)self arrivalAirport],
                                            v40 = objc_claimAutoreleasedReturnValue(),
                                            [(SFFlightLeg *)v8 arrivalAirport],
                                            v82 = objc_claimAutoreleasedReturnValue(),
                                            v83 = v40,
                                            objc_msgSend(v40, "isEqual:")))
                                      {
                                        v85 = [(SFFlightLeg *)self divertedAirport];
                                        v84 = [(SFFlightLeg *)v8 divertedAirport];
                                        if ((v85 == 0) == (v84 != 0))
                                        {
                                          int v139 = 0;
                                          BOOL v158 = 0;
                                          int v136 = 0;
                                          int v141 = 0;
                                          BOOL v157 = 0;
                                          int v138 = 0;
                                          uint64_t v144 = 0;
                                          BOOL v156 = 0;
                                          uint64_t v146 = 0;
                                          uint64_t v152 = 0;
                                          uint64_t v148 = 0;
                                          int v13 = 0;
                                          int v14 = 0;
                                          int v15 = 0;
                                          int v16 = 0;
                                          char v17 = 0;
                                          *((void *)&v150 + 1) = 0x100000001;
                                          *(void *)&long long v150 = 0x100000001;
                                          *(_DWORD *)&v149[24] = 0;
                                          *(void *)&v149[16] = 0x100000001;
                                          *(void *)&v149[8] = 0x100000001;
                                          uint64_t v147 = 0x100000001;
                                          *(void *)v149 = 0x100000001;
                                          uint64_t v145 = 0x100000001;
                                          int v142 = 1;
                                          int v137 = 1;
                                          int v143 = 1;
                                          int v135 = 1;
                                          int v140 = 1;
                                          int v134 = 1;
                                        }
                                        else
                                        {
                                          uint64_t v41 = [(SFFlightLeg *)self divertedAirport];
                                          BOOL v158 = v41 != 0;
                                          v81 = (void *)v41;
                                          if (!v41
                                            || ([(SFFlightLeg *)self divertedAirport],
                                                v42 = objc_claimAutoreleasedReturnValue(),
                                                [(SFFlightLeg *)v8 divertedAirport],
                                                v77 = objc_claimAutoreleasedReturnValue(),
                                                v78 = v42,
                                                objc_msgSend(v42, "isEqual:")))
                                          {
                                            v80 = [(SFFlightLeg *)self title];
                                            v79 = [(SFFlightLeg *)v8 title];
                                            if ((v80 == 0) == (v79 != 0))
                                            {
                                              int v141 = 0;
                                              BOOL v157 = 0;
                                              int v138 = 0;
                                              uint64_t v144 = 0;
                                              BOOL v156 = 0;
                                              uint64_t v146 = 0;
                                              uint64_t v152 = 0;
                                              uint64_t v148 = 0;
                                              int v13 = 0;
                                              int v14 = 0;
                                              int v15 = 0;
                                              int v16 = 0;
                                              char v17 = 0;
                                              *((void *)&v150 + 1) = 0x100000001;
                                              *(void *)&long long v150 = 0x100000001;
                                              *(_DWORD *)&v149[24] = 0;
                                              *(void *)&v149[16] = 0x100000001;
                                              *(void *)&v149[8] = 0x100000001;
                                              uint64_t v147 = 0x100000001;
                                              *(void *)v149 = 0x100000001;
                                              uint64_t v145 = 0x100000001;
                                              int v142 = 1;
                                              int v137 = 1;
                                              int v143 = 1;
                                              int v135 = 1;
                                              int v140 = 1;
                                              int v134 = 1;
                                              int v139 = 1;
                                              int v136 = 1;
                                            }
                                            else
                                            {
                                              uint64_t v43 = [(SFFlightLeg *)self title];
                                              BOOL v157 = v43 != 0;
                                              v76 = (void *)v43;
                                              if (!v43
                                                || ([(SFFlightLeg *)self title],
                                                    v44 = objc_claimAutoreleasedReturnValue(),
                                                    [(SFFlightLeg *)v8 title],
                                                    v72 = objc_claimAutoreleasedReturnValue(),
                                                    v73 = v44,
                                                    objc_msgSend(v44, "isEqual:")))
                                              {
                                                v75 = [(SFFlightLeg *)self baggageClaim];
                                                v74 = [(SFFlightLeg *)v8 baggageClaim];
                                                if ((v75 == 0) == (v74 != 0))
                                                {
                                                  uint64_t v144 = 0;
                                                  BOOL v156 = 0;
                                                  uint64_t v146 = 0;
                                                  uint64_t v152 = 0;
                                                  uint64_t v148 = 0;
                                                  int v13 = 0;
                                                  int v14 = 0;
                                                  int v15 = 0;
                                                  int v16 = 0;
                                                  char v17 = 0;
                                                  *((void *)&v150 + 1) = 0x100000001;
                                                  *(void *)&long long v150 = 0x100000001;
                                                  *(_DWORD *)&v149[24] = 0;
                                                  *(void *)&v149[16] = 0x100000001;
                                                  *(void *)&v149[8] = 0x100000001;
                                                  uint64_t v147 = 0x100000001;
                                                  *(void *)v149 = 0x100000001;
                                                  uint64_t v145 = 0x100000001;
                                                  int v142 = 1;
                                                  int v137 = 1;
                                                  int v143 = 1;
                                                  int v135 = 1;
                                                  int v140 = 1;
                                                  int v134 = 1;
                                                  int v139 = 1;
                                                  int v136 = 1;
                                                  int v141 = 1;
                                                  int v138 = 1;
                                                }
                                                else
                                                {
                                                  uint64_t v45 = [(SFFlightLeg *)self baggageClaim];
                                                  BOOL v156 = v45 != 0;
                                                  v71 = (void *)v45;
                                                  if (!v45
                                                    || ([(SFFlightLeg *)self baggageClaim],
                                                        v46 = objc_claimAutoreleasedReturnValue(),
                                                        [(SFFlightLeg *)v8 baggageClaim],
                                                        v67 = objc_claimAutoreleasedReturnValue(),
                                                        v68 = v46,
                                                        objc_msgSend(v46, "isEqual:")))
                                                  {
                                                    v70 = [(SFFlightLeg *)self departureGateClosedTime];
                                                    v69 = [(SFFlightLeg *)v8 departureGateClosedTime];
                                                    if ((v70 == 0) == (v69 != 0))
                                                    {
                                                      uint64_t v146 = 0;
                                                      uint64_t v152 = 0;
                                                      uint64_t v148 = 0;
                                                      int v13 = 0;
                                                      int v14 = 0;
                                                      int v15 = 0;
                                                      int v16 = 0;
                                                      char v17 = 0;
                                                      *((void *)&v150 + 1) = 0x100000001;
                                                      *(void *)&long long v150 = 0x100000001;
                                                      *(void *)&v149[20] = 1;
                                                      *(_DWORD *)&v149[16] = 1;
                                                      *(void *)&v149[8] = 0x100000001;
                                                      uint64_t v147 = 0x100000001;
                                                      *(void *)v149 = 0x100000001;
                                                      uint64_t v145 = 0x100000001;
                                                      int v142 = 1;
                                                      int v137 = 1;
                                                      int v143 = 1;
                                                      int v135 = 1;
                                                      int v140 = 1;
                                                      int v134 = 1;
                                                      int v139 = 1;
                                                      int v136 = 1;
                                                      int v141 = 1;
                                                      int v138 = 1;
                                                      uint64_t v144 = 0x100000001;
                                                    }
                                                    else
                                                    {
                                                      uint64_t v47 = [(SFFlightLeg *)self departureGateClosedTime];
                                                      HIDWORD(v152) = v47 != 0;
                                                      v66 = (void *)v47;
                                                      if (!v47
                                                        || (-[SFFlightLeg departureGateClosedTime](self, "departureGateClosedTime"), v48 = objc_claimAutoreleasedReturnValue(), -[SFFlightLeg departureGateClosedTime](v8, "departureGateClosedTime"), objc_super v64 = objc_claimAutoreleasedReturnValue(), v65 = v48, objc_msgSend(v48, "isEqual:")))
                                                      {
                                                        v63 = [(SFFlightLeg *)self departureRunwayTime];
                                                        v62 = [(SFFlightLeg *)v8 departureRunwayTime];
                                                        if ((v63 == 0) == (v62 != 0))
                                                        {
                                                          uint64_t v148 = 0;
                                                          LODWORD(v152) = 0;
                                                          int v13 = 0;
                                                          int v14 = 0;
                                                          int v15 = 0;
                                                          int v16 = 0;
                                                          char v17 = 0;
                                                          *((void *)&v150 + 1) = 0x100000001;
                                                          *(void *)&long long v150 = 0x100000001;
                                                          *(_DWORD *)&v149[24] = 0;
                                                          *(void *)&v149[16] = 0x100000001;
                                                          *(void *)&v149[8] = 0x100000001;
                                                          uint64_t v147 = 0x100000001;
                                                          *(void *)v149 = 0x100000001;
                                                          uint64_t v145 = 0x100000001;
                                                          int v142 = 1;
                                                          int v137 = 1;
                                                          int v143 = 1;
                                                          int v135 = 1;
                                                          int v140 = 1;
                                                          int v134 = 1;
                                                          int v139 = 1;
                                                          int v136 = 1;
                                                          int v141 = 1;
                                                          int v138 = 1;
                                                          uint64_t v144 = 0x100000001;
                                                          uint64_t v146 = 0x100000001;
                                                        }
                                                        else
                                                        {
                                                          uint64_t v49 = [(SFFlightLeg *)self departureRunwayTime];
                                                          LODWORD(v152) = v49 != 0;
                                                          v61 = (void *)v49;
                                                          if (!v49
                                                            || (-[SFFlightLeg departureRunwayTime](self, "departureRunwayTime"), v50 = objc_claimAutoreleasedReturnValue(), -[SFFlightLeg departureRunwayTime](v8, "departureRunwayTime"), v59 = objc_claimAutoreleasedReturnValue(), v60 = v50, objc_msgSend(v50, "isEqual:")))
                                                          {
                                                            v58 = [(SFFlightLeg *)self arrivalRunwayTime];
                                                            v57 = [(SFFlightLeg *)v8 arrivalRunwayTime];
                                                            if ((v58 == 0) == (v57 != 0))
                                                            {
                                                              int v13 = 0;
                                                              int v14 = 0;
                                                              int v15 = 0;
                                                              int v16 = 0;
                                                              char v17 = 0;
                                                              *((void *)&v150 + 1) = 0x100000001;
                                                              *(void *)&long long v150 = 0x100000001;
                                                              *(_DWORD *)&v149[24] = 0;
                                                              *(void *)&v149[16] = 0x100000001;
                                                              *(void *)&v149[8] = 0x100000001;
                                                              uint64_t v147 = 0x100000001;
                                                              *(void *)v149 = 0x100000001;
                                                              uint64_t v145 = 0x100000001;
                                                              int v142 = 1;
                                                              int v137 = 1;
                                                              int v143 = 1;
                                                              int v135 = 1;
                                                              int v140 = 1;
                                                              int v134 = 1;
                                                              int v139 = 1;
                                                              int v136 = 1;
                                                              int v141 = 1;
                                                              int v138 = 1;
                                                              uint64_t v144 = 0x100000001;
                                                              uint64_t v146 = 0x100000001;
                                                              uint64_t v148 = 0x100000001;
                                                            }
                                                            else
                                                            {
                                                              uint64_t v51 = [(SFFlightLeg *)self arrivalRunwayTime];
                                                              *(_DWORD *)&v149[24] = v51 != 0;
                                                              v56 = (void *)v51;
                                                              if (!v51
                                                                || (-[SFFlightLeg arrivalRunwayTime](self, "arrivalRunwayTime"), v52 = objc_claimAutoreleasedReturnValue(), -[SFFlightLeg arrivalRunwayTime](v8, "arrivalRunwayTime"), v54 = objc_claimAutoreleasedReturnValue(), v55 = v52, objc_msgSend(v52, "isEqual:")))
                                                              {
                                                                v53 = [(SFFlightLeg *)self arrivalGateTime];
                                                                uint64_t v5 = [(SFFlightLeg *)v8 arrivalGateTime];
                                                                if ((v53 == 0) == (v5 != 0))
                                                                {
                                                                  int v15 = 0;
                                                                  int v16 = 0;
                                                                  char v17 = 0;
                                                                  *((void *)&v150 + 1) = 0x100000001;
                                                                  *(void *)&long long v150 = 0x100000001;
                                                                  *(void *)&v149[16] = 0x100000001;
                                                                  *(void *)&v149[8] = 0x100000001;
                                                                  *(void *)v149 = 0x100000001;
                                                                  uint64_t v147 = 0x100000001;
                                                                  uint64_t v145 = 0x100000001;
                                                                  int v142 = 1;
                                                                  int v137 = 1;
                                                                  int v143 = 1;
                                                                  int v135 = 1;
                                                                  int v140 = 1;
                                                                  int v134 = 1;
                                                                  int v139 = 1;
                                                                  int v136 = 1;
                                                                  int v141 = 1;
                                                                  int v138 = 1;
                                                                  uint64_t v144 = 0x100000001;
                                                                  uint64_t v146 = 0x100000001;
                                                                  uint64_t v148 = 0x100000001;
                                                                  int v13 = 1;
                                                                  int v14 = 1;
                                                                }
                                                                else
                                                                {
                                                                  uint64_t v10 = [(SFFlightLeg *)self arrivalGateTime];
                                                                  if (v10)
                                                                  {
                                                                    uint64_t v3 = [(SFFlightLeg *)self arrivalGateTime];
                                                                    uint64_t v4 = [(SFFlightLeg *)v8 arrivalGateTime];
                                                                    char v17 = [(id)v3 isEqual:v4];
                                                                    int v16 = 1;
                                                                    *((void *)&v150 + 1) = 0x100000001;
                                                                    *(void *)&long long v150 = 0x100000001;
                                                                    *(void *)&v149[16] = 0x100000001;
                                                                    *(void *)&v149[8] = 0x100000001;
                                                                    *(void *)v149 = 0x100000001;
                                                                    uint64_t v147 = 0x100000001;
                                                                    uint64_t v145 = 0x100000001;
                                                                    int v142 = 1;
                                                                    int v137 = 1;
                                                                    int v143 = 1;
                                                                    int v135 = 1;
                                                                    int v140 = 1;
                                                                    int v134 = 1;
                                                                    int v139 = 1;
                                                                    int v136 = 1;
                                                                    int v141 = 1;
                                                                    int v138 = 1;
                                                                    uint64_t v144 = 0x100000001;
                                                                    uint64_t v146 = 0x100000001;
                                                                    uint64_t v148 = 0x100000001;
                                                                    int v13 = 1;
                                                                    int v14 = 1;
                                                                    int v15 = 1;
                                                                  }
                                                                  else
                                                                  {
                                                                    int v16 = 0;
                                                                    *((void *)&v150 + 1) = 0x100000001;
                                                                    *(void *)&long long v150 = 0x100000001;
                                                                    *(void *)&v149[16] = 0x100000001;
                                                                    *(void *)&v149[8] = 0x100000001;
                                                                    *(void *)v149 = 0x100000001;
                                                                    uint64_t v147 = 0x100000001;
                                                                    uint64_t v145 = 0x100000001;
                                                                    int v142 = 1;
                                                                    int v137 = 1;
                                                                    int v143 = 1;
                                                                    int v135 = 1;
                                                                    int v140 = 1;
                                                                    int v134 = 1;
                                                                    int v139 = 1;
                                                                    int v136 = 1;
                                                                    int v141 = 1;
                                                                    int v138 = 1;
                                                                    uint64_t v144 = 0x100000001;
                                                                    uint64_t v146 = 0x100000001;
                                                                    uint64_t v148 = 0x100000001;
                                                                    int v13 = 1;
                                                                    int v14 = 1;
                                                                    int v15 = 1;
                                                                    char v17 = 1;
                                                                  }
                                                                }
                                                              }
                                                              else
                                                              {
                                                                int v14 = 0;
                                                                int v15 = 0;
                                                                int v16 = 0;
                                                                char v17 = 0;
                                                                *((void *)&v150 + 1) = 0x100000001;
                                                                *(void *)&long long v150 = 0x100000001;
                                                                *(void *)&v149[16] = 0x100000001;
                                                                *(void *)&v149[8] = 0x100000001;
                                                                *(void *)v149 = 0x100000001;
                                                                uint64_t v147 = 0x100000001;
                                                                uint64_t v145 = 0x100000001;
                                                                int v142 = 1;
                                                                int v137 = 1;
                                                                int v143 = 1;
                                                                int v135 = 1;
                                                                int v140 = 1;
                                                                int v134 = 1;
                                                                int v139 = 1;
                                                                int v136 = 1;
                                                                int v141 = 1;
                                                                int v138 = 1;
                                                                uint64_t v144 = 0x100000001;
                                                                uint64_t v146 = 0x100000001;
                                                                uint64_t v148 = 0x100000001;
                                                                int v13 = 1;
                                                                *(_DWORD *)&v149[24] = 1;
                                                              }
                                                            }
                                                          }
                                                          else
                                                          {
                                                            int v13 = 0;
                                                            int v14 = 0;
                                                            int v15 = 0;
                                                            int v16 = 0;
                                                            char v17 = 0;
                                                            *((void *)&v150 + 1) = 0x100000001;
                                                            *(void *)&long long v150 = 0x100000001;
                                                            *(_DWORD *)&v149[24] = 0;
                                                            *(void *)&v149[16] = 0x100000001;
                                                            *(void *)&v149[8] = 0x100000001;
                                                            uint64_t v147 = 0x100000001;
                                                            *(void *)v149 = 0x100000001;
                                                            uint64_t v145 = 0x100000001;
                                                            int v142 = 1;
                                                            int v137 = 1;
                                                            int v143 = 1;
                                                            int v135 = 1;
                                                            int v140 = 1;
                                                            int v134 = 1;
                                                            int v139 = 1;
                                                            int v136 = 1;
                                                            int v141 = 1;
                                                            int v138 = 1;
                                                            uint64_t v144 = 0x100000001;
                                                            uint64_t v146 = 0x100000001;
                                                            uint64_t v148 = 1;
                                                            LODWORD(v152) = 1;
                                                          }
                                                        }
                                                      }
                                                      else
                                                      {
                                                        uint64_t v148 = 0;
                                                        uint64_t v152 = 0x100000000;
                                                        int v13 = 0;
                                                        int v14 = 0;
                                                        int v15 = 0;
                                                        int v16 = 0;
                                                        char v17 = 0;
                                                        *((void *)&v150 + 1) = 0x100000001;
                                                        *(void *)&long long v150 = 0x100000001;
                                                        *(_DWORD *)&v149[24] = 0;
                                                        *(void *)&v149[16] = 0x100000001;
                                                        *(void *)&v149[8] = 0x100000001;
                                                        uint64_t v147 = 0x100000001;
                                                        *(void *)v149 = 0x100000001;
                                                        uint64_t v145 = 0x100000001;
                                                        int v142 = 1;
                                                        int v137 = 1;
                                                        int v143 = 1;
                                                        int v135 = 1;
                                                        int v140 = 1;
                                                        int v134 = 1;
                                                        int v139 = 1;
                                                        int v136 = 1;
                                                        int v141 = 1;
                                                        int v138 = 1;
                                                        uint64_t v144 = 0x100000001;
                                                        uint64_t v146 = 1;
                                                      }
                                                    }
                                                  }
                                                  else
                                                  {
                                                    uint64_t v144 = 0x100000000;
                                                    uint64_t v146 = 0;
                                                    uint64_t v152 = 0;
                                                    uint64_t v148 = 0;
                                                    int v13 = 0;
                                                    int v14 = 0;
                                                    int v15 = 0;
                                                    int v16 = 0;
                                                    char v17 = 0;
                                                    *((void *)&v150 + 1) = 0x100000001;
                                                    *(void *)&long long v150 = 0x100000001;
                                                    *(_DWORD *)&v149[24] = 0;
                                                    *(void *)&v149[16] = 0x100000001;
                                                    *(void *)&v149[8] = 0x100000001;
                                                    uint64_t v147 = 0x100000001;
                                                    *(void *)v149 = 0x100000001;
                                                    uint64_t v145 = 0x100000001;
                                                    int v142 = 1;
                                                    int v137 = 1;
                                                    int v143 = 1;
                                                    int v135 = 1;
                                                    int v140 = 1;
                                                    int v134 = 1;
                                                    int v139 = 1;
                                                    int v136 = 1;
                                                    int v141 = 1;
                                                    int v138 = 1;
                                                    BOOL v156 = 1;
                                                  }
                                                }
                                              }
                                              else
                                              {
                                                int v138 = 0;
                                                uint64_t v144 = 0;
                                                BOOL v156 = 0;
                                                uint64_t v146 = 0;
                                                uint64_t v152 = 0;
                                                uint64_t v148 = 0;
                                                int v13 = 0;
                                                int v14 = 0;
                                                int v15 = 0;
                                                int v16 = 0;
                                                char v17 = 0;
                                                *((void *)&v150 + 1) = 0x100000001;
                                                *(void *)&long long v150 = 0x100000001;
                                                *(_DWORD *)&v149[24] = 0;
                                                *(void *)&v149[16] = 0x100000001;
                                                *(void *)&v149[8] = 0x100000001;
                                                uint64_t v147 = 0x100000001;
                                                *(void *)v149 = 0x100000001;
                                                uint64_t v145 = 0x100000001;
                                                int v142 = 1;
                                                int v137 = 1;
                                                int v143 = 1;
                                                int v135 = 1;
                                                int v140 = 1;
                                                int v134 = 1;
                                                int v139 = 1;
                                                int v136 = 1;
                                                int v141 = 1;
                                                BOOL v157 = 1;
                                              }
                                            }
                                          }
                                          else
                                          {
                                            int v136 = 0;
                                            int v141 = 0;
                                            BOOL v157 = 0;
                                            int v138 = 0;
                                            uint64_t v144 = 0;
                                            BOOL v156 = 0;
                                            uint64_t v146 = 0;
                                            uint64_t v152 = 0;
                                            uint64_t v148 = 0;
                                            int v13 = 0;
                                            int v14 = 0;
                                            int v15 = 0;
                                            int v16 = 0;
                                            char v17 = 0;
                                            *((void *)&v150 + 1) = 0x100000001;
                                            *(void *)&long long v150 = 0x100000001;
                                            *(_DWORD *)&v149[24] = 0;
                                            *(void *)&v149[16] = 0x100000001;
                                            *(void *)&v149[8] = 0x100000001;
                                            uint64_t v147 = 0x100000001;
                                            *(void *)v149 = 0x100000001;
                                            uint64_t v145 = 0x100000001;
                                            int v142 = 1;
                                            int v137 = 1;
                                            int v143 = 1;
                                            int v135 = 1;
                                            int v140 = 1;
                                            int v134 = 1;
                                            int v139 = 1;
                                            BOOL v158 = 1;
                                          }
                                        }
                                      }
                                      else
                                      {
                                        int v134 = 0;
                                        int v139 = 0;
                                        BOOL v158 = 0;
                                        int v136 = 0;
                                        int v141 = 0;
                                        BOOL v157 = 0;
                                        int v138 = 0;
                                        uint64_t v144 = 0;
                                        BOOL v156 = 0;
                                        uint64_t v146 = 0;
                                        uint64_t v152 = 0;
                                        uint64_t v148 = 0;
                                        int v13 = 0;
                                        int v14 = 0;
                                        int v15 = 0;
                                        int v16 = 0;
                                        char v17 = 0;
                                        *((void *)&v150 + 1) = 0x100000001;
                                        *(void *)&long long v150 = 0x100000001;
                                        *(_DWORD *)&v149[24] = 0;
                                        *(void *)&v149[16] = 0x100000001;
                                        *(void *)&v149[8] = 0x100000001;
                                        uint64_t v147 = 0x100000001;
                                        *(void *)v149 = 0x100000001;
                                        uint64_t v145 = 0x100000001;
                                        int v142 = 1;
                                        int v137 = 1;
                                        int v143 = 1;
                                        int v135 = 1;
                                        int v140 = 1;
                                        BOOL v159 = 1;
                                      }
                                    }
                                  }
                                  else
                                  {
                                    int v135 = 0;
                                    int v140 = 0;
                                    BOOL v159 = 0;
                                    int v134 = 0;
                                    int v139 = 0;
                                    BOOL v158 = 0;
                                    int v136 = 0;
                                    int v141 = 0;
                                    BOOL v157 = 0;
                                    int v138 = 0;
                                    uint64_t v144 = 0;
                                    BOOL v156 = 0;
                                    uint64_t v146 = 0;
                                    uint64_t v152 = 0;
                                    uint64_t v148 = 0;
                                    int v13 = 0;
                                    int v14 = 0;
                                    int v15 = 0;
                                    int v16 = 0;
                                    char v17 = 0;
                                    *((void *)&v150 + 1) = 0x100000001;
                                    *(void *)&long long v150 = 0x100000001;
                                    *(_DWORD *)&v149[24] = 0;
                                    *(void *)&v149[16] = 0x100000001;
                                    *(void *)&v149[8] = 0x100000001;
                                    uint64_t v147 = 0x100000001;
                                    *(void *)v149 = 0x100000001;
                                    uint64_t v145 = 0x100000001;
                                    int v142 = 1;
                                    int v137 = 1;
                                    int v143 = 1;
                                    BOOL v160 = 1;
                                  }
                                }
                              }
                              else
                              {
                                int v137 = 0;
                                int v143 = 0;
                                BOOL v160 = 0;
                                int v135 = 0;
                                int v140 = 0;
                                BOOL v159 = 0;
                                int v134 = 0;
                                int v139 = 0;
                                BOOL v158 = 0;
                                int v136 = 0;
                                int v141 = 0;
                                BOOL v157 = 0;
                                int v138 = 0;
                                uint64_t v144 = 0;
                                BOOL v156 = 0;
                                uint64_t v146 = 0;
                                uint64_t v152 = 0;
                                uint64_t v148 = 0;
                                int v13 = 0;
                                int v14 = 0;
                                int v15 = 0;
                                int v16 = 0;
                                char v17 = 0;
                                *((void *)&v150 + 1) = 0x100000001;
                                *(void *)&long long v150 = 0x100000001;
                                *(_DWORD *)&v149[24] = 0;
                                *(void *)&v149[16] = 0x100000001;
                                *(void *)&v149[8] = 0x100000001;
                                uint64_t v147 = 0x100000001;
                                *(void *)v149 = 0x100000001;
                                uint64_t v145 = 0x100000001;
                                int v142 = 1;
                                LODWORD(v161[0]) = 1;
                              }
                            }
                          }
                          else
                          {
                            int v142 = 0;
                            uint64_t v145 = 0x100000000;
                            v161[0] = 0x100000000;
                            int v137 = 0;
                            int v143 = 0;
                            BOOL v160 = 0;
                            int v135 = 0;
                            int v140 = 0;
                            BOOL v159 = 0;
                            int v134 = 0;
                            int v139 = 0;
                            BOOL v158 = 0;
                            int v136 = 0;
                            int v141 = 0;
                            BOOL v157 = 0;
                            int v138 = 0;
                            uint64_t v144 = 0;
                            BOOL v156 = 0;
                            uint64_t v146 = 0;
                            uint64_t v152 = 0;
                            uint64_t v148 = 0;
                            int v13 = 0;
                            int v14 = 0;
                            int v15 = 0;
                            int v16 = 0;
                            char v17 = 0;
                            *((void *)&v150 + 1) = 0x100000001;
                            *(void *)&long long v150 = 0x100000001;
                            *(_DWORD *)&v149[24] = 0;
                            *(void *)&v149[16] = 0x100000001;
                            *(void *)&v149[8] = 0x100000001;
                            uint64_t v147 = 0x100000001;
                            *(void *)v149 = 0x100000001;
                          }
                        }
                      }
                      else
                      {
                        uint64_t v145 = 0;
                        uint64_t v147 = 0x100000000;
                        v161[0] = 0;
                        int v142 = 0;
                        int v137 = 0;
                        int v143 = 0;
                        BOOL v160 = 0;
                        int v135 = 0;
                        int v140 = 0;
                        BOOL v159 = 0;
                        int v134 = 0;
                        int v139 = 0;
                        BOOL v158 = 0;
                        int v136 = 0;
                        int v141 = 0;
                        BOOL v157 = 0;
                        int v138 = 0;
                        uint64_t v144 = 0;
                        BOOL v156 = 0;
                        uint64_t v146 = 0;
                        uint64_t v152 = 0;
                        uint64_t v148 = 0;
                        int v13 = 0;
                        int v14 = 0;
                        int v15 = 0;
                        int v16 = 0;
                        char v17 = 0;
                        *((void *)&v150 + 1) = 0x100000001;
                        *(void *)&long long v150 = 0x100000001;
                        *(_DWORD *)&v149[24] = 0;
                        *(void *)&v149[16] = 0x100000001;
                        *(void *)&v149[8] = 0x100000001;
                        *(void *)v149 = 0x100000001;
                        LODWORD(v161[1]) = 1;
                      }
                    }
                    goto LABEL_11;
                  }
                  *(void *)&v149[8] = 0x100000000;
                  int v151 = 0;
                  uint64_t v147 = 0;
                  *(void *)v149 = 0x100000000;
                  uint64_t v145 = 0;
                  int v142 = 0;
                  memset(v161, 0, 12);
                  int v137 = 0;
                  int v143 = 0;
                  BOOL v160 = 0;
                  int v135 = 0;
                  int v140 = 0;
                  BOOL v159 = 0;
                  int v134 = 0;
                  int v139 = 0;
                  BOOL v158 = 0;
                  int v136 = 0;
                  int v141 = 0;
                  BOOL v157 = 0;
                  int v138 = 0;
                  uint64_t v144 = 0;
                  BOOL v156 = 0;
                  uint64_t v146 = 0;
                  uint64_t v152 = 0;
                  uint64_t v148 = 0;
                  int v13 = 0;
                  int v14 = 0;
                  int v15 = 0;
                  int v16 = 0;
                  char v17 = 0;
                  *((void *)&v150 + 1) = 0x100000001;
                  *(void *)&long long v150 = 0x100000001;
                  *(_DWORD *)&v149[24] = 0;
                  *(void *)&v149[16] = 0x100000001;
                }
                else
                {
                  *(void *)&v149[4] = 0;
                  int v151 = 0;
                  uint64_t v147 = 0;
                  *(_DWORD *)v149 = 0;
                  uint64_t v145 = 0;
                  int v142 = 0;
                  memset(v161, 0, 12);
                  int v137 = 0;
                  int v143 = 0;
                  BOOL v160 = 0;
                  int v135 = 0;
                  int v140 = 0;
                  BOOL v159 = 0;
                  int v134 = 0;
                  int v139 = 0;
                  BOOL v158 = 0;
                  int v136 = 0;
                  int v141 = 0;
                  BOOL v157 = 0;
                  int v138 = 0;
                  uint64_t v144 = 0;
                  BOOL v156 = 0;
                  uint64_t v146 = 0;
                  uint64_t v152 = 0;
                  uint64_t v148 = 0;
                  int v13 = 0;
                  int v14 = 0;
                  int v15 = 0;
                  int v16 = 0;
                  char v17 = 0;
                  *((void *)&v150 + 1) = 0x100000001;
                  *(void *)&long long v150 = 0x100000001;
                  *(_DWORD *)&v149[24] = 0;
                  *(_DWORD *)&v149[12] = 1;
                  *(void *)&v149[16] = 0x100000001;
                  LODWORD(v153) = 1;
                }
              }
            }
            else
            {
              *(void *)&long long v153 = 0x100000000;
              int v151 = 0;
              uint64_t v147 = 0;
              memset(v149, 0, 20);
              uint64_t v145 = 0;
              int v142 = 0;
              memset(v161, 0, 12);
              int v137 = 0;
              int v143 = 0;
              BOOL v160 = 0;
              int v135 = 0;
              int v140 = 0;
              BOOL v159 = 0;
              int v134 = 0;
              int v139 = 0;
              BOOL v158 = 0;
              int v136 = 0;
              int v141 = 0;
              BOOL v157 = 0;
              int v138 = 0;
              uint64_t v144 = 0;
              BOOL v156 = 0;
              uint64_t v146 = 0;
              uint64_t v152 = 0;
              uint64_t v148 = 0;
              int v13 = 0;
              int v14 = 0;
              int v15 = 0;
              int v16 = 0;
              char v17 = 0;
              *((void *)&v150 + 1) = 0x100000001;
              *(void *)&long long v150 = 0x100000001;
              *(_DWORD *)&v149[20] = 1;
              *(_DWORD *)&v149[24] = 0;
            }
          }
        }
        else
        {
          *(void *)&long long v150 = 0x100000000;
          *(void *)&long long v153 = 0;
          memset(v149, 0, sizeof(v149));
          int v151 = 0;
          uint64_t v147 = 0;
          uint64_t v145 = 0;
          int v142 = 0;
          memset(v161, 0, 12);
          int v137 = 0;
          int v143 = 0;
          BOOL v160 = 0;
          int v135 = 0;
          int v140 = 0;
          BOOL v159 = 0;
          int v134 = 0;
          int v139 = 0;
          BOOL v158 = 0;
          int v136 = 0;
          int v141 = 0;
          BOOL v157 = 0;
          int v138 = 0;
          uint64_t v144 = 0;
          BOOL v156 = 0;
          uint64_t v146 = 0;
          uint64_t v152 = 0;
          uint64_t v148 = 0;
          int v13 = 0;
          int v14 = 0;
          int v15 = 0;
          int v16 = 0;
          char v17 = 0;
          *((void *)&v150 + 1) = 0x100000001;
          DWORD2(v153) = 1;
        }
      }
    }
    else
    {
      *(void *)((char *)&v150 + 4) = 0;
      *(void *)((char *)&v153 + 4) = 0;
      LODWORD(v150) = 0;
      LODWORD(v153) = 0;
      memset(v149, 0, sizeof(v149));
      int v151 = 0;
      uint64_t v147 = 0;
      uint64_t v145 = 0;
      int v142 = 0;
      memset(v161, 0, 12);
      int v137 = 0;
      int v143 = 0;
      BOOL v160 = 0;
      int v135 = 0;
      int v140 = 0;
      BOOL v159 = 0;
      int v134 = 0;
      int v139 = 0;
      BOOL v158 = 0;
      int v136 = 0;
      int v141 = 0;
      BOOL v157 = 0;
      int v138 = 0;
      uint64_t v144 = 0;
      BOOL v156 = 0;
      uint64_t v146 = 0;
      uint64_t v152 = 0;
      uint64_t v148 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      char v17 = 0;
      HIDWORD(v150) = 1;
      HIDWORD(v153) = 1;
    }
  }
LABEL_11:
  if (v16)
  {
    int v18 = v13;
    int v19 = v14;
    int v20 = v15;

    int v15 = v20;
    int v14 = v19;
    int v13 = v18;
  }
  if (v15) {

  }
  if (v14)
  {
  }
  if (*(_DWORD *)&v149[24])
  {
  }
  if (v13) {

  }
  if (HIDWORD(v148))
  {
  }
  if (v152)
  {
  }
  if (v148) {

  }
  if (HIDWORD(v146))
  {
  }
  if (HIDWORD(v152))
  {
  }
  if (v146) {

  }
  if (v144)
  {
  }
  if (v156)
  {
  }
  if (HIDWORD(v144)) {

  }
  if (v138)
  {
  }
  if (v157)
  {
  }
  if (v141) {

  }
  if (v136)
  {
  }
  if (v158)
  {
  }
  if (v139) {

  }
  if (v134)
  {
  }
  if (v159)
  {
  }
  if (v140) {

  }
  if (v135)
  {
  }
  if (v160)
  {
  }
  if (v143) {

  }
  if (v137)
  {
  }
  if (LODWORD(v161[0]))
  {
  }
  if (v145) {

  }
  if (v142)
  {
  }
  if (HIDWORD(v161[0]))
  {
  }
  if (v147) {

  }
  if (HIDWORD(v145))
  {
  }
  if (LODWORD(v161[1]))
  {
  }
  if (*(_DWORD *)v149) {

  }
  if (HIDWORD(v147))
  {
  }
  if (v151)
  {
  }
  if (*(_DWORD *)&v149[8]) {

  }
  if (*(_DWORD *)&v149[4])
  {
  }
  if (v153)
  {
  }
  if (*(_DWORD *)&v149[16]) {

  }
  if (*(_DWORD *)&v149[12])
  {
  }
  if (DWORD1(v153))
  {
  }
  if (v150) {

  }
  if (*(_DWORD *)&v149[20])
  {
  }
  if (DWORD2(v153))
  {
  }
  if (DWORD2(v150)) {

  }
  if (DWORD1(v150))
  {
  }
  if (HIDWORD(v153))
  {
  }
  if (HIDWORD(v150)) {

  }
  if (v155 == v154)
  {
  }
LABEL_114:

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setStatus:", -[SFFlightLeg status](self, "status"));
  uint64_t v5 = [(SFFlightLeg *)self departurePublishedTime];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setDeparturePublishedTime:v6];

  uint64_t v7 = [(SFFlightLeg *)self departureActualTime];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setDepartureActualTime:v8];

  int v9 = [(SFFlightLeg *)self departureTerminal];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setDepartureTerminal:v10];

  uint64_t v11 = [(SFFlightLeg *)self departureGate];
  uint64_t v12 = (void *)[v11 copy];
  [v4 setDepartureGate:v12];

  int v13 = [(SFFlightLeg *)self departureAirport];
  int v14 = (void *)[v13 copy];
  [v4 setDepartureAirport:v14];

  int v15 = [(SFFlightLeg *)self arrivalPublishedTime];
  int v16 = (void *)[v15 copy];
  [v4 setArrivalPublishedTime:v16];

  char v17 = [(SFFlightLeg *)self arrivalActualTime];
  int v18 = (void *)[v17 copy];
  [v4 setArrivalActualTime:v18];

  int v19 = [(SFFlightLeg *)self arrivalTerminal];
  int v20 = (void *)[v19 copy];
  [v4 setArrivalTerminal:v20];

  uint64_t v21 = [(SFFlightLeg *)self arrivalGate];
  uint64_t v22 = (void *)[v21 copy];
  [v4 setArrivalGate:v22];

  BOOL v23 = [(SFFlightLeg *)self arrivalAirport];
  v24 = (void *)[v23 copy];
  [v4 setArrivalAirport:v24];

  uint64_t v25 = [(SFFlightLeg *)self divertedAirport];
  v26 = (void *)[v25 copy];
  [v4 setDivertedAirport:v26];

  uint64_t v27 = [(SFFlightLeg *)self title];
  v28 = (void *)[v27 copy];
  [v4 setTitle:v28];

  uint64_t v29 = [(SFFlightLeg *)self baggageClaim];
  BOOL v30 = (void *)[v29 copy];
  [v4 setBaggageClaim:v30];

  uint64_t v31 = [(SFFlightLeg *)self departureGateClosedTime];
  v32 = (void *)[v31 copy];
  [v4 setDepartureGateClosedTime:v32];

  uint64_t v33 = [(SFFlightLeg *)self departureRunwayTime];
  v34 = (void *)[v33 copy];
  [v4 setDepartureRunwayTime:v34];

  uint64_t v35 = [(SFFlightLeg *)self arrivalRunwayTime];
  v36 = (void *)[v35 copy];
  [v4 setArrivalRunwayTime:v36];

  uint64_t v37 = [(SFFlightLeg *)self arrivalGateTime];
  v38 = (void *)[v37 copy];
  [v4 setArrivalGateTime:v38];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBFlightLeg alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBFlightLeg *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBFlightLeg alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBFlightLeg *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBFlightLeg alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBFlightLeg *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFFlightLeg)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBFlightLeg alloc] initWithData:v5];
  uint64_t v7 = [(SFFlightLeg *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_status = a3;
}

@end