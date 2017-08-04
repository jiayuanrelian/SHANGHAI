/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/6/8 16:30:21                            */
/*==============================================================*/


drop table if exists T_GZ_ACTION;

drop table if exists T_GZ_EVENT;

drop table if exists T_GZ_EVENT_WD;

drop table if exists T_GZ_INFO;

drop table if exists T_GZ_INFO_VS_EVENT_WD;

/*==============================================================*/
/* Table: T_GZ_ACTION                                           */
/*==============================================================*/
create table T_GZ_ACTION
(
   ID                   bigint not null auto_increment,
   REF_CHILD_PRODUCT_ID bigint,
   REF_GZ_INFO_ID       bigint,
   REF_WD_ID            bigint,
   POINT_RATE           int,
   POINT_BASE           int,
   REASON               varchar(200),
   STATUS               char(1),
   DEL_FLAG             char(1) comment '0:δɾ��;1:��ɾ��',
   DATE_CREATED         datetime,
   CREATER_ID           varchar(32),
   DATE_UPDATED         datetime,
   UPDATER_ID           varchar(32),
   primary key (ID)
);

/*==============================================================*/
/* Table: T_GZ_EVENT                                            */
/*==============================================================*/
create table T_GZ_EVENT
(
   id                   bigint not null auto_increment,
   CODE                 varchar(32) comment '��������drl�ļ��� Ψһ����',
   NAME                 varchar(20),
   STATUS               char(1) comment '(0:δ��Ч;1:����Ч;2:�ѹ���)',
   TYPE                 varchar(32),
   DEL_FLAG             char(1) comment '0:δɾ��;1:��ɾ��',
   DATE_CREATED         datetime,
   CREATER_ID           varchar(32),
   DATE_UPDATED         datetime,
   UPDATER_ID           varchar(32),
   primary key (id)
);

/*==============================================================*/
/* Table: T_GZ_EVENT_WD                                         */
/*==============================================================*/
create table T_GZ_EVENT_WD
(
   ID                   bigint not null auto_increment,
   CODE                 varchar(32),
   NAME                 varchar(32),
   STATUS               char(1),
   TYPE                 char(1) comment '(0:�ı�;1:����;2:ö��;3����)',
   TYPE_KEY             varchar(32),
   REF_EVENT_ID         bigint,
   IS_COUNTER           char(1) comment '0:��;1:��',
   REF_COUNTER_ID       bigint,
   DEL_FLAG             char(1) comment '0:δɾ��;1:��ɾ��',
   DATE_CREATED         datetime,
   CREATER_ID           varchar(32),
   DATE_UPDATED         datetime,
   UPDATER_ID           varchar(32),
   IS_PUBLIC            char(1) comment '0:��;1:��',
   PUBLIC_TYPE          varchar(32),
   primary key (ID)
);

/*==============================================================*/
/* Table: T_GZ_INFO                                             */
/*==============================================================*/
create table T_GZ_INFO
(
   ID                   bigint not null auto_increment,
   CODE                 varchar(32) comment '�����ļ������ rule����',
   NAME                 varchar(32),
   TYPE                 char(1) comment '(0:�����;1:�������)',
   BRIEF_INFO           varchar(320),
   STATUS               char(1) comment '(0:δ��Ч;1:����Ч;2:��ʧЧ)',
   VERSION              int comment 'ÿ�޸�һ��,����һ,ʱ�̼��,�������ɹ����ļ�',
   REF_EVENT_ID         bigint,
   REF_ZCD_ID           bigint,
   DEL_FLAG             char(1) comment '0:δɾ��;1:��ɾ��',
   POINT_VALIDATE       datetime,
   DATE_CREATED         datetime,
   CREATER_ID           varchar(32),
   DATE_UPDATED         datetime,
   UPDATER_ID           varchar(32),
   primary key (ID)
);

/*==============================================================*/
/* Table: T_GZ_INFO_VS_EVENT_WD                                 */
/*==============================================================*/
create table T_GZ_INFO_VS_EVENT_WD
(
   ID                   bigint not null auto_increment,
   INFO_ID              bigint,
   EVENT_WD_ID          bigint,
   OPERATOR             varchar(32),
   OPE_VALUE            varchar(32),
   SORT_NUM             int,
   primary key (ID)
);

